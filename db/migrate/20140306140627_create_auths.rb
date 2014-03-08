class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :auth_type, :default => 'radius'
      t.boolean :auth_device, :default => false
      t.integer :access_node_id

      t.timestamps
    end
  end
end
