# encoding: utf-8
class ActivityController < ApplicationController
  before_filter :check_admin

  def timeline
    @node_count = AccessNode.count_online_node
    @conn_count = Connection.count_online_conn
    @group = AccessNode.where("last_seen is not null").order(last_seen: :desc).limit(5)

  end

end
