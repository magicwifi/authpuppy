class AccessNode < ActiveRecord::Base
  default_scope order('updated_at DESC')
  has_many :connections
  has_many :trusted_macs
  has_many :black_macs
  has_many :public_ips
  has_many :online_connections, :class_name => "Connection", :conditions => "used_on is not null and (expired_on is null or expired_on > NOW())"
  has_one :auth
  has_one :conf

  attr_accessible :last_seen, :mac, :name, :portal_url, :redirect_url, :remote_addr, :sys_memfree, :sys_upload, :sys_uptime, :update_time, :cmdflag, :configflag, :cmdline, :time_limit, :auth, :lat, :long, :developer
  validates :name, presence: true, uniqueness:true

  VALID_MAC_REGEX = /^[0-9A-F]+$/
  validates :mac, presence:true, uniqueness:true, length: { is:12 }, format: { with: VALID_MAC_REGEX }
  before_validation :sanitize_mac

  class << self
    def show_unlinked
      AccessNode.where("last_seen < ? and last_seen > ? ",Time.now - 60, Time.now - 600)
    end

    def disconnect
      nodes = AccessNode.show_unlinked
      nodes.each do |node|
        node.clean_all_conn
      end
    end
    
    def count_online_node
      AccessNode.where("last_seen > ? ", Time.now-60 ).count
    end


  end

  def show_online
    self.online_connections.count
  end

  def list_uniq_mac
    self.connections.select(:mac).uniq
  end

  def sanitize_mac
    self.mac = AccessNode.sanitize_mac_address(self.mac)
  end

  def self.find_by_mac(mac)
    self.find(:first, :conditions => ["mac = ?", sanitize_mac_address(mac)])
  end

  def self.sanitize_mac_address(mac)
    return nil if mac.nil?
    mac.gsub(/[:-]/, "").upcase
  end

  def total_up
    bytes_up = 0
    connections = self.connections.find(:all, :conditions => [ 'created_at > ?', Time.now - 1.month ])
    connections.each do |connection|
      unless connection.outgoing.nil?
        bytes_up += connection.outgoing
      end
    end
    return bytes_up
  end

  def total_down
    bytes_down = 0
    connections = self.connections.find(:all, :conditions => [ 'created_at > ?', Time.now - 1.month ])
    connections.each do |connection|
      unless connection.incoming.nil?  
        bytes_down += connection.incoming
      end
    end
    return bytes_down
  end

  def running?
    if self.last_seen && Time.now-self.last_seen < 60
      return true;
    else
      return false;
    end 
  end
 
  def clean_all_conn 
    connections = self.online_connections
    connections.each do |connection|
      connection.expire!
    end
  end

  def show_running?
    if self.last_seen && Time.now-self.last_seen < 60
      return true;
    else
      return false;
    end 
  end

  def banned_mac?(mac)
    self.black_macs.each do |black|
      if black.mac == mac
        return true;
      end
    end
    return  false;
  end

  def self.bindurl(params)
    if params[:data].nil? || params[:data].length > 10
      {:check=>false,:code=>104, :msg=>"Data More Than ten"}
    else
      begin
        self.transaction do
          params[:data].each do |object|
            object[:developer] = params[:username]
            access = self.create!(object)
            Auth.create!(auth_type:"radius",auth_device:false,access_node_id:access.id)
            Conf.create!(access_node_id:access.id)
          end
        end
      rescue Exception => e
        return {:check=>false,:code=>105, :msg=>"Insert Error #{e.to_s}"}
      end
      {:check=>true, :code=>200, :msg=>"Success"}
    end
  end
  
  def self.show_connections(mac)
    access = self.find_by_mac(mac)
    if  access
      connections = access.connections.limit(5)
      status = Status.first
      { :check=>true,  :conn=>connections, :status => status }
    else
      {:check=>false, :code=>102,:msg=>"Not Found AccessNode"}
    end
  end

  def self.update_auth_type(params)
    times = params[:times].to_i
    if times<=0 or times>5
      {:check=>false, :code=>102, :msg=>"Execced Max Number"}
    elsif params[:authtype].nil? or !access=self.find_by_mac(params[:mac])
      {:check=>false, :code=>104,:msg=>"Not Found AccessNode"}
    else
        authtype = params[:authtype].to_s  
      begin
        access.auth.update_attributes!(auth_type:authtype) 
      rescue Exception => e
        {:check=>false,:code=>103, :msg=>"Insert Error #{e.to_s}"}
      end
      {:check=>true,:code=>200,:msg=>"Success"}
    end
  end

  def self.update_auth_device(params)
    times = params[:times].to_i
    if times<=0 or times>5
      return {:check=>false, :code=>102, :msg=>"Execced Max Number"}
    elsif !access=self.find_by_mac(params[:mac])
      {:check=>false, :code=>104,:msg=>"Not Found AccessNode"}
    else
      begin
        access.auth.update_attributes!(auth_device:params[:authdevice]) 
      rescue Exception => e
        return {:check=>false,:code=>103, :msg=>"Insert Error #{e.to_s}"}
      end
      {:check=>true,:code=>200,:msg=>"Success"}
    end
  end

  def self.update_access_time(params)
    times = params[:times].to_i
    timeline = params[:time_delay].to_i
    if times<=0 or times>5
      return {:check=>false, :code=>102, :msg=>"Execced Max Number"}
    elsif  timeline > 720 or timeline <= 0
      return {:check=>false, :code=>105, :msg=>"Set Wrong Time"}
    elsif !access = self.find_by_mac(params[:mac])
      {:check=>false, :code=>104,:msg=>"Not Found AccessNode"}
    else
      begin
        access.update_attributes!(time_limit:timeline) 
      rescue Exception => e
        return {:check=>false,:code=>103, :msg=>"Insert Error #{e.to_s}"}
      end
      {:check=>true,:code=>200,:msg=>"Success"}
    end
  end


end

