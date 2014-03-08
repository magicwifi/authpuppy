class AddCmdlineToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :cmdline, :string
    AccessNode.update_all :cmdline => ""  
  end
end
