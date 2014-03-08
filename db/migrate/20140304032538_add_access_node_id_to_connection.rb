class AddAccessNodeIdToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :access_node_id, :integer
  end
end
