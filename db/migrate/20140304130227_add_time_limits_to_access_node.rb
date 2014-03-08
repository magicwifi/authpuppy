class AddTimeLimitsToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :time_limit, :integer
  end
end
