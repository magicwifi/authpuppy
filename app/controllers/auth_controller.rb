# encoding: utf-8
class AuthController < ApplicationController
  before_filter :check_admin

  def update
    if params[:id].nil? and params[:auth_type].nil? and params[:auth_device].nil?
      redirect_to "/404"
      return;
    end

    @access = AccessNode.find(params[:id])
    if @access.nil?
      redirect_to "/404"
      return;
    end
  
    if @access.auth.nil?
      auth = Auth.create(auth_type:params[:auth_type],auth_device:params[:auth_device],:access_node_id => params[:id])
    else
      auth = Auth.create(auth_type:params[:auth_type],auth_device:params[:auth_device])
      begin
        AccessNode.transaction do
          @access.auth.delete()
          @access.update_attributes(:auth => auth)
        end
      rescue Exception => e
        flash[:notice] = "操作失败"
        redirect_to advance_url(@access) 
        return;
      end
    end
    respond_to do |format|  
      format.html { render :text=>"Success Create Auth" }
      format.js { render :layout=>false }
    end
  end

end
