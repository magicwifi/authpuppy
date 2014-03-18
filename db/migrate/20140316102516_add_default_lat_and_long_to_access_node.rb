class AddDefaultLatAndLongToAccessNode < ActiveRecord::Migration
  def change
    change_column :access_nodes, :lat, :float, :default => 32.02661580632 
    change_column :access_nodes, :long, :float, :default =>118.78789414488 
  end

end
