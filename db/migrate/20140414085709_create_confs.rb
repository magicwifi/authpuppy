class CreateConfs < ActiveRecord::Migration
  def change
    create_table :confs do |t|
      t.integer :checkinterval
      t.integer :authinterval
      t.integer :checktimeout
      t.integer :httpmaxconn
      t.integer :access_node_id

      t.timestamps
    end
  end
end
