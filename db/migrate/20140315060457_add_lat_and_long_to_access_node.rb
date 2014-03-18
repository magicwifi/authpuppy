class AddLatAndLongToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :lat, :float
    add_column :access_nodes, :long, :float
  end
end
