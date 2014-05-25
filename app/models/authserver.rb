class Authserver < ActiveRecord::Base
  attr_accessible :access_node_id, :ipaddr
  belongs_to :access_node

  validates :ipaddr, presence: true
end
