class RemoveAccessNodeMacFromConnection < ActiveRecord::Migration
  def up
    remove_column :connections, :access_node_mac
  end

  def down
    add_column :connections, :access_node_mac, :string
  end
end
