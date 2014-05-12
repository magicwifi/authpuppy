class Auth < ActiveRecord::Base
  attr_accessible :access_node_id, :auth_device, :auth_type
  belongs_to :access_node



  def self.read_radius
    return @req unless @req.nil?  
    dict = Radiustar::Dictionary.new('/usr/share/freeradius/')
    @req = Radiustar::Request.new('61.160.137.138', { :dict => dict })
  end

  
  def check_device(device)
    unless auth_device
        return true 
    else
        authenticate_device(device)
    end 
  end


  def authenticate(username, password,logintype)
    if logintype == "pwd"
        authenticate_radius(username, password)
    else
        authenticate_splash
    end
  end


  def authenticate_splash
    return true
  end

  def authenticate_device(device)
    if device.include? "windows" or device.include? "mac" or device.include? "uknow"
        return false
    else
        return true
    end
  end

  def authenticate_radius(username, password)


    auth_custom_attr = {
      'NAS-IP-Address'  => '124.127.116.178',
      'NAS-Port'        => 1,
      'NAS-Port-Type'   => 'Wireless-802.11',
      'User-Name' => username
    }

    req = self.class.read_radius

    reply = req.authenticate(username, password, 'aruba',
                             auth_custom_attr)
   
    if reply[:code] == 'Access-Accept'
        return true;
    else
        return false;
    end

  end

  @req = self.read_radius 

end
