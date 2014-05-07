# encoding: utf-8
class ApplicationController < ActionController::Base

  @@last_garbage_collection ||= nil

  def garbage_collect
    if !@@last_garbage_collection or Time.now - @@last_garbage_collection >= 5.minutes
      logger.info "Garbage collection"
      @@last_garbage_collection = Time.now

      delete_unused_connections
      expire_old_connections
      #AccessNode.disconnect
    end
  end


  private
  def delete_unused_connections
    five_minutes_ago = Time.now - 5.minutes
    for connection in Connection.find(:all, :conditions => ["used_on is null and created_at < ?", five_minutes_ago])
      connection.destroy
    end
  end



  def expire_old_connections
    five_minutes_ago = Time.now - 5.minutes
    for connection in Connection.find(:all, :conditions => ["used_on is not null and expired_on is null and updated_at < ?", five_minutes_ago])
      connection.update_attribute("expired_on", Time.now)
    end
  end

  def current_admin
    @current_admin ||= Admin.find_by_token(cookies[:token]) if cookies[:token]
  end

  helper_method :current_admin

  def check_admin
    unless current_admin
      redirect_to :root, :notice => "请先登陆"
    end
  end


end
