# encoding: utf-8
class WifidogController < ApplicationController
  before_filter :garbage_collect

  def ping
    render :text => AccessNode.ping(params)
  end

  def retrieve
    render :text => AccessNode.retrieve(params)
  end

  def fetchconf
    render :text => AccessNode.fetchconf(params)
  end

  def denied
    render :text=>"Denied Action", :status => 404
  end

  def auth
    render :text => Connection.authupdate(params)
  end

end
