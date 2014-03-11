#encoding: utf-8
class AdminsController < ApplicationController
  
  def login
    cookies.delete(:token)
  end

  def logout
    cookies.delete(:token)
    redirect_to root_url, :notice => "已经退出登录"
  end

  def create_login_session
    admin = Admin.find_by_name(params[:name])
    if admin && admin.authenticate(params[:password])
      cookies.permanent[:token] = admin.token
      redirect_to access_nodes_url, :notice => "登录成功"
    else
      flash[:notice] = "无效的用户名和密码"
      redirect_to :action => "login"
    end
  end

end
