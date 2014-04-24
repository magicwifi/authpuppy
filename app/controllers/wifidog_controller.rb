# encoding: utf-8
class WifidogController < ApplicationController
  before_filter :garbage_collect
  
  def ping
    node = AccessNode.find_by_mac(params[:gw_id])
    if node
      node.update_attributes(
                :sys_uptime => params[:sys_uptime],
                :sys_upload => params[:sys_load],
                :sys_memfree => params[:sys_memfree],
                :update_time => params[:wifidog_uptime],
                :remote_addr => request.remote_addr,
                :last_seen => Time.now
      )
    end
   
    if node.configflag == true
      node.update_attributes( :configflag => false );
      render :text => "Pong:"
    else
      render :text => "Pong"
    end
  end

  def retrieve
    node = AccessNode.find_by_mac(params[:gw_id])
    render :text => "Cmd:"+node.cmdline
  end

  def fetchconf

    node = AccessNode.find_by_mac(params[:gw_id])
    if !node.nil?
      str =""
      node.update_attributes( :last_seen => Time.now, :configflag=>false )
    #render :text => "Conf:checkinterval=60&authinterval=120&clienttimeout=5&httpdmaxconn=5&trustedmaclist=98:d6:f7:8a:77:03&firewallrule=117.34.78.195+61.139.2.69"
      conf = node.conf
      if !conf.nil?
        str += "Conf:checkinterval="+conf.checkinterval.to_s+"&authinterval="+conf.authinterval.to_s+"&clienttimeout="+conf.clienttimeout.to_s+"&httpdmaxconn="+conf.httpmaxconn.to_s
      end

      if !node.trusted_macs.empty?
        str += "&trustedmaclist="
        macs = Array.new
        node.trusted_macs.each do |trusted|
          macs.push(trusted.mac)
        end
        str += macs.join("+")
      end

      if !node.public_ips.empty?
        str += "&firewallrule="
        ips = Array.new
        node.public_ips.each do |ip|
          ips.push(ip.publicip)
        end
        str += ips.join("+")
      end
      
      render :text => str
    else
      redirect_to "/404"
      return;
    end
  end

  def denied
    render :text=>"Denied Action", :status => 404
  end

  def auth
    authupdate
  end

  def authupdate
    auth = 0
    if !connection = Connection.find_by_token(params[:token])
      logger.info "Invalid token: #{params[:token]}"
    else 
      case params[:stage]
      when 'login'
        if connection.expired? or connection.used?
          logger.info "Tried to login with used or expired token: #{params[:token]}"
        else
          connection.update_attributes({
            :mac => params[:mac],
            :ipaddr => params[:ip],
            :incoming => params[:incoming],
            :outgoing => params[:outgoing],
            :used_on => Time.now
          })                        
          auth = 1
        end
      when 'counters'
        if !connection.expired?
          auth = 1
          connection.update_attributes({
            :mac => params[:mac],
            :ipaddr => params[:ip],
            :incoming => params[:incoming],
            :outgoing => params[:outgoing]
          })                        
          end
      when 'logout'
        logger.info "Logging out: #{params[:token]}"
        connection.expire!
      else          
        logger.info "Invalid stage: #{params[:stage]}"
      end    
    end
    render :text => "Auth: #{auth}"
  end
end
