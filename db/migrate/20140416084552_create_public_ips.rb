class CreatePublicIps < ActiveRecord::Migration
  def change
    create_table :public_ips do |t|
      t.integer :access_node_id
      t.string :publicip

      t.timestamps
    end
  end
end
