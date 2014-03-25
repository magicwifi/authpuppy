# encoding: utf-8
class GuestController < ApplicationController

  def show_connections
    if params[:mac].nil? or params[:username].nil? or params[:password].nil?
      respond_to do |format|
        format.html {render text: "Error101-Missing Some Parameters"}
        format.json {render :json => {:status => {:code=>101,:message=>"Missing Paramters"}}}
      end
      return;
    end
    username = params[:username]
    password = params[:password]
    mac = params[:mac]
    guest = Guest.find_by_name(username)
    access = AccessNode.find_by_mac(params[:mac])
    if guest && guest.authenticate(password) && access
      @connections = access.connections.limit(5)
      @status = Status.first
      #respond_to do |format|
        #format.html {render text: "success"}
        #format.json {render json: @connections.to_json(:only => [:mac,:expired_on,:phonenum,:device ])}    
      #end
    else
      respond_to do |format|
        format.html {render text: "Error102-Error Value "}
        format.json {render :json => {:status => {:code=>102,:message=>"Error Value"}}}
      end
      return;
    end
  end

  def bindurl
    if params[:data].nil? or params[:username].nil? or params[:password].nil?
      respond_to do |format|
        format.html {render text: "Error101-Missing Some Parameters"}
        format.json {render :json => {:status => {:code=>101, :message=>"Missing Some Parameters"}}}
      end
      return;
    end

    username = params[:username]
    password = params[:password]
    guest = Guest.find_by_name(username)

    if guest && guest.authenticate(password)
      begin
        objArray = params[:data]
        if objArray.length > 5
          respond_to do |format|
            format.html {render text: "Error104-Data More Than 10"}
            format.json {render :json => {:status => {:code=>104,:message=>"Data More Than 10"}}}
          end
          return;
        end
        AccessNode.transaction do
          objArray.each do |object|
            access = AccessNode.create!(object)
            Auth.create!(auth_type:"radius",auth_device:false,access_node_id:access.id)
          end
        end
      rescue Exception => e
        respond_to do |format|
          format.html {render text: "Error102-Insert Error"}
          format.json {render :json => {:status => {:code=>102,:message=>"Insert Error"}}}
        end
        return;
      end
      respond_to do |format|
        format.html {render text: "Success Insert"}
        format.json {render :json => {:status => {:code=>200,:message=>"Success Insert"}}}
      end
    else
      respond_to do |format|
        format.html {render text: "Error103-Auth Error"}
        format.json {render :json => {:status => {:code=>103,:message=>"Auth Error"}}}
      end
    end
  end

  def update_auth_type
    if  params[:username].nil? or params[:password].nil? or params[:times].nil?
      respond_to do |format|
        format.html {render text: "Error101-Missing Some Parameters"}
        format.json {render :json => {:status => {:code=>101, :message=>"Missing Some Parameters"}}}
      end
      return;
    end
    times = params[:times].to_i

    if  times > 5 or times <= 0
      respond_to do |format|
        format.html {render text: "Error102-Exceed the maximum number of calls"}
        format.json {render :json => {:status => {:code=>102, :message=>"Exceed the maximum number of calls"}}}
      end
      return;
    end
    username = params[:username]
    password = params[:password]
    mac = params[:mac]
    guest = Guest.find_by_name(username)
    type = params[:authtype]
    access = AccessNode.find_by_mac(params[:mac])
    if guest and  guest.authenticate(password) and access and type 
      begin
        access.auth.update_attributes!(auth_type:type) 
      rescue Exception => e
        respond_to do |format|
          format.html {render text: "Error104-Update Error"}
          format.json {render :json => {:status => {:code=>104,:message=>"Update Error"}}}
        end
        return;
      end
      respond_to do |format|
        format.html {render text: "Success Update Auth Type"}
        format.json {render :json => {:status => {:code=>200,:message=>"Success Updat Auth Type"}}}
      end
    else
      respond_to do |format|
        format.html {render text: "Error103-Error Value "}
        format.json {render :json => {:status => {:code=>103,:message=>"Error Value"}}}
      end
      return;
    end
  end

  def update_auth_device
    if  params[:username].nil? or params[:password].nil? or params[:times].nil?
      respond_to do |format|
        format.html {render text: "Error101-Missing Some Parameters"}
        format.json {render :json => {:status => {:code=>101, :message=>"Missing Some Parameters"}}}
      end
      return;
    end
    times = params[:times].to_i

    if  times > 5 or times <= 0
      respond_to do |format|
        format.html {render text: "Error102-Exceed the maximum number of calls"}
        format.json {render :json => {:status => {:code=>102, :message=>"Exceed the maximum number of calls"}}}
      end
      return;
    end
    username = params[:username]
    password = params[:password]
    mac = params[:mac]
    guest = Guest.find_by_name(username)
    auth_device = params[:pclogin]
    access = AccessNode.find_by_mac(params[:mac])
    if guest and  guest.authenticate(password) and access and auth_device 
      begin
        access.auth.update_attributes!(auth_device:auth_device) 
      rescue Exception => e
        respond_to do |format|
          format.html {render text: "Error104-Update Error"}
          format.json {render :json => {:status => {:code=>104,:message=>"Update Error"}}}
        end
        return;
      end
      respond_to do |format|
        format.html {render text: "Success Update Auth Type"}
        format.json {render :json => {:status => {:code=>200,:message=>"Success Updat Auth Type"}}}
      end
    else
      respond_to do |format|
        format.html {render text: "Error103-Error Value "}
        format.json {render :json => {:status => {:code=>103,:message=>"Error Value"}}}
      end
      return;
    end
    
  end

  def update_access_time
    if  params[:username].nil? or params[:password].nil? or params[:times].nil?
      respond_to do |format|
        format.html {render text: "Error101-Missing Some Parameters"}
        format.json {render :json => {:status => {:code=>101, :message=>"Missing Some Parameters"}}}
      end
      return;
    end

    times = params[:times].to_i

    if  times > 5 or times <= 0
      respond_to do |format|
        format.html {render text: "Error102-Exceed the maximum number of calls"}
        format.json {render :json => {:status => {:code=>102, :message=>"Exceed the maximum number of calls"}}}
      end
      return;
    end

    timeline = params[:time_delay].to_i

    if  timeline > 720 or timeline <= 0
      respond_to do |format|
        format.html {render text: "Error105-Set Wrong Time"}
        format.json {render :json => {:status => {:code=>105, :message=>"Set Wrong Time"}}}
      end
      return;
    end

    username = params[:username]
    password = params[:password]
    mac = params[:mac]
    guest = Guest.find_by_name(username)
    access = AccessNode.find_by_mac(params[:mac])
    if guest and  guest.authenticate(password) and access  
      begin
        access.update_attributes!(time_limit:timeline) 
      rescue Exception => e
        respond_to do |format|
          format.html {render text: "Error104-Update Error"}
          format.json {render :json => {:status => {:code=>104,:message=>"Update Error"}}}
        end
        return;
      end
      respond_to do |format|
        format.html {render text: "Success Update Auth Type"}
        format.json {render :json => {:status => {:code=>200,:message=>"Success Updat Auth Type"}}}
      end
    else
      respond_to do |format|
        format.html {render text: "Error103-Error Value "}
        format.json {render :json => {:status => {:code=>103,:message=>"Error Value"}}}
      end
      return;
    end
  end



end
