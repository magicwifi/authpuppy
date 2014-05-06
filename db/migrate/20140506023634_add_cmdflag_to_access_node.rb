class AddCmdflagToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :cmdflag, :boolean
    AccessNode.update_all :cmdflag => true  
  end
end
