# encoding: utf-8
class ConfController < ApplicationController
  before_filter :check_admin

  def update
    if params[:id].nil? and params[:checkinterval].nil? and params[:authinterval].nil? and params[:clienttimeout].nil? and params[:httpmaxconn]
      redirect_to "/404"
      return;
    end

    @access = AccessNode.find(params[:id])
    if @access.nil?
      redirect_to "/404"
      return;
    end
  
    if @access.conf.nil?
      Conf.create(checkinterval:params[:checkinterval],authinterval:params[:authinterval],clienttimeout:params[:clienttimeout],httpmaxconn:params[:httpmaxconn],authserver:params[:authserver],access_node_id => params[:id])
    else
      @access.conf.update_attributes(checkinterval:params[:checkinterval],authinterval:params[:authinterval],clienttimeout:params[:clienttimeout],httpmaxconn:params[:httpmaxconn],authserver:params[:authserver])
    end
    @access.update_attributes(:cmdline=>"wdctl restart", :configflag =>true ) 
    flash[:notice] = "初始化成功，正在重启设备"
    redirect_to access_nodes_url;
  end

end
