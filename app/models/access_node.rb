class AccessNode < ActiveRecord::Base

  has_many :connections
  has_many :online_connections, :class_name => "Connection", :conditions => "used_on is not null and (expired_on is null or expired_on > NOW())"
  has_one :auth

  attr_accessible :last_seen, :mac, :name, :portal_url, :redirect_url, :remote_addr, :sys_memfree, :sys_upload, :sys_uptime, :update_time, :configflag, :cmdline, :time_limit
  validates :name, presence: true, uniqueness:true

  VALID_MAC_REGEX = /^[0-9A-F]+$/
  validates :mac, presence:true, uniqueness:true, length: { is:12 }, format: { with: VALID_MAC_REGEX }
  before_validation :sanitize_mac



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


end
