class AddIndexToAccessNodesMac < ActiveRecord::Migration
  def change
    add_index :access_nodes, :mac, unique: true
  end
end
