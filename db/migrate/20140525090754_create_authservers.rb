class CreateAuthservers < ActiveRecord::Migration
  def change
    create_table :authservers do |t|
      t.string :ipaddr
      t.integer :access_node_id

      t.timestamps
    end
  end
end
