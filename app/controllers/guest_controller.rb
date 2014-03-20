# encoding: utf-8
class GuestController < ApplicationController

  def show
    @status = Status.first
    @connections = Connection.all
  end


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
        if objArray.length > 10
          respond_to do |format|
            format.html {render text: "Error104-Data More Than 10"}
            format.json {render :json => {:status => {:code=>104,:message=>"Data More Than 10"}}}
          end
          return;
        end
        AccessNode.transaction do
          objArray.each do |object|
            AccessNode.create!(object)
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

end
