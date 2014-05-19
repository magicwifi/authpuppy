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
