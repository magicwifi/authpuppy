class CreateBlackMacs < ActiveRecord::Migration
  def change
    create_table :black_macs do |t|
      t.integer :access_node_id
      t.string :mac

      t.timestamps
    end
  end
end
