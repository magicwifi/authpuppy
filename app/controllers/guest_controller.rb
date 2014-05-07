# encoding: utf-8
class GuestController < ApplicationController
  before_filter :check_params

  def back_code(code,msg)
    respond_to do |format|
      format.html {render text: "Error#{code.to_s}-#{msg}"}
      format.json {render :json => {:status => {:code=>code.to_s, :message=>msg}}}
    end
  end

  def check_params
    if params[:username].nil? or params[:password].nil?
      back_code(101,"Missing Some Params") 
    elsif !Guest.auth_guest(params[:username],params[:password])
      back_code(103,"Auth Error") 
    end
  end

  def show_connections
    check = AccessNode.show_connections(params[:mac])
    if check[:check]
      @connections, @status = check[:conn], check[:status]
    else
      back_code(check[:code],check[:msg]);
    end
  end


  def self.define_component(name)
    define_method(name) {
      check = AccessNode.send name, params
      if check[:check]
        back_code(check[:code],check[:msg])
      else
        back_code(check[:code],check[:msg])
      end 
    }
  end
  
  define_component  :update_auth_type
  define_component  :update_auth_device
  define_component  :update_access_time
  define_component  :bindurl

end
