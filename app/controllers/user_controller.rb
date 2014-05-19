# encoding: utf-8
class UserController < ApplicationController

  def login
    redirect_to AccessNode.login(params) 
  end 
  

  def authenticate
      device = request.user_agent.downcase
      redirect_to  AccessNode.authenticate(params,device)
  end

  def portal
    redirect_to AccessNode.portal(params)
  end

  def logout
    @connection = Connection.logout(params);
    if !@connection
      render :text=> "Empty Offline"
    else  
      respond_to do |format|  
        format.html { render :text=>"Success Offline" }
        format.js { render :layout=>false }
      end
    end
  end


end
