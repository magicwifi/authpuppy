# encoding: utf-8
class UserController < ApplicationController

  def login
    node = AccessNode.find_by_mac(params[:gw_id]) 
    if node.nil? 
      redirect_to "/404"
      return
    end
    if !node.redirect_url.blank?
      redirect_url = node.redirect_url+"&gw_address="+params[:gw_address].to_s+"&gw_port="+params[:gw_port].to_s+"&gw_id="+params[:gw_id].to_s+"&public_ip=124.127.116.178"
      redirect_to redirect_url
    else
      @userdevice = request.user_agent.downcase
      render :action => "login", :layout => false
    end
  end 
  
  def loginsw
    return :layout => false
  end


  def authenticate
    if params[:gw_id].nil? or params[:gw_address].nil? or params[:gw_port].nil?
      redirect_to "/404"
      return
    end 
    
    node = AccessNode.find_by_mac(params[:gw_id])
    
    if node.nil? 
      redirect_to "/404"
      return
    end
    
    username = params[:username]
    password = params[:checkcode]
    
    device = request.user_agent.downcase
    phone = /(\(.+\)).+(\(.+\))/ 
    m = phone.match(device)

    if m  
      userdevice = m[1]
    else
      userdevice = "uknown device"
    end

    deviceflag = node.auth.check_device(userdevice)
    if !deviceflag
      redirect_to "/404"
      return
    end

    authflag =   node.auth.authenticate username, password
    
    if !authflag 
      redirect_url = node.redirect_url+"&gw_address="+params[:gw_address].to_s+"&gw_port="+params[:gw_port].to_s+"&gw_id="+params[:gw_id].to_s+"&public_ip=124.127.116.178"
      redirect_to redirect_url
      return
    else

      token=SecureRandom.urlsafe_base64(nil, false)


      if !node.time_limit.nil? and node.time_limit > 0
        login_connection = Connection.create!(:token => token,
                                              :phonenum => username,
                                              :access_mac => params[:gw_id],
                                              :device => userdevice,
                                              :access_node_id => node.id,
                                              :expired_on => Time.now+node.time_limit.minutes,
                                              :portal_url => params[:url] 
                                             )
      else
        login_connection = Connection.create!(:token => token,
                                              :phonenum => username,
                                              :access_mac => params[:gw_id],
                                              :device => userdevice,
                                              :access_node_id => node.id,
                                              :expired_on => Time.now+5.minutes,
                                              :portal_url => params[:url] 
                                             )
      end
      redirect_to  'http://'+params[:gw_address]+':'+params[:gw_port].to_s+'/wifidog/auth?token='+token
    end
  end

  def portal
    node = AccessNode.find_by_mac(params[:gw_id])
    if node.nil?
      redirect_to "/404"
      return
    end
    if !node.portal_url.blank?
      redirect_to node.portal_url
    else
      redirect_to "http://www.baidu.com"
    end
  end

  def logout
    @connection = Connection.find_by_token(params[:token]);
    if @connection.nil?
      render :text=> "Empty Connection"
    else  
      if @connection.expire!
        respond_to do |format|  
          format.html { render :text=>"Success Offline" }
          format.js { render :layout=>false }
        end
      else
        render :text=> "Error Offilne"
      end 
    end
  end

  def bindurl
    if params[:data].nil? or params[:username].nil? or params[:password].nil?
      render :text => "Error101--Missing parameter"
      return;
    end

    username = params[:username]
    password = params[:password]+
    admin = Admin.find_by_name(username)

    if admin && admin.authenticate(password)
      begin
        objArray = params[:data]
        if objArray.length > 10
          render :text =>"Error104--Json length should less than 10 "
          return;
        end
        AccessNode.transaction do
          objArray.each do |object|
            AccessNode.create!(object)
          end
        end
      rescue Exception => e
        render :text =>"Error102--Json format error "
        return;
      end
      render :text =>"Success Insert"
    else
      render :text =>"Error103--Auth error"
    end
  end

end
