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
      render :text => "Pong:"+node.cmdline
    else
      render :text => "Pong"
    end
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
          connection.use!
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
