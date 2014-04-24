class BlackMac < ActiveRecord::Base
  attr_accessible :access_node_id, :mac
  belongs_to :access_node

  VALID_MAC_REGEX = /^[0-9a-z]{2}:[0-9a-z]{2}:[0-9a-z]{2}:[0-9a-z]{2}:[0-9a-z]{2}:[0-9a-z]{2}$/
  validates :mac, presence:true, :uniqueness => {:scope => :access_node_id}, length: { is:17 }, format: { with: VALID_MAC_REGEX }
  validates :access_node_id, presence: true

end
