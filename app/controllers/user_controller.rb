# encoding: utf-8
class UserController < ApplicationController

  def login
    redirect_to AccessNode.login(params) 
  end 
  

  def authenticate
      redirect_to  AccessNode.authenticate(params)
  end

  def portal
    node = AccessNode.find_by_mac(params[:gw_id])
    if node.nil?
      redirect_to "/404"
      return
    end
    if !node.portal_url.blank?
      redirect_to node.portal_url+"&mac="+params[:mac].to_s
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


end
