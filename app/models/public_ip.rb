class PublicIp < ActiveRecord::Base
  attr_accessible :access_node_id, :publicip
  belongs_to :access_node

  VALID_MAC_REGEX = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
  validates :publicip, presence:true, :uniqueness => {:scope => :access_node_id}, format: { with: VALID_MAC_REGEX }
  validates :access_node_id, presence: true

end
