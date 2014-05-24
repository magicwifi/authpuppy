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

  def add_nodes
    result = HTTParty.post("http://124.127.116.177/bindurl.json",
                                :body => params,
                                :headers => { 'Content-Type' => 'application/json' } )
    render :text => result
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

  
  def self.define_show(name)
    define_method(name) {
      check = AccessNode.send name, params
      if check[:check]
        @results, @status = check[:results], check[:status]
      else
        back_code(check[:code],check[:msg])
      end 
    }
  end

  
  define_component  :update_auth_type
  define_component  :update_auth_device
  define_component  :update_access_time
  define_component  :bindurl
  define_component  :update_portal_url
  define_show  :show_nodes
  define_show  :show_node
  define_show  :show_connections

end
