class AddColumnToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :update_config, :boolean, :default => false
    AccessNode.update_all :update_config => false  
  end
end
