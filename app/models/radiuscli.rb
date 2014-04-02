require 'singleton'


class Radiuscli

  include Singleton

  def initialize
    dict = Radiustar::Dictionary.new('/usr/share/freeradius/')

    @req = Radiustar::Request.new('192.168.3.10', { :dict => dict })

  end

  def authenticate_radius(username, password)

    reply = @req.authenticate(username, password, 'aruba', {'NAS-IP-Address'  => '124.127.116.178','NAS-Port'        => 1,'NAS-Port-Type'   => 'Wireless-802.11','User-Name' => username})

    return reply[:code] == 'Access-Accept'

  end

end
