class Conf < ActiveRecord::Base
  attr_accessible :access_node_id, :authinterval, :checkinterval, :clienttimeout, :httpmaxconn
  belongs_to :access_node

  validates :authinterval, presence: true
  validates :checkinterval, presence: true
  validates :clienttimeout, presence: true
  validates :httpmaxconn, presence: true
  validates :access_node_id, presence: true

end
