class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :token
      t.string :ipaddr
      t.string :access_mac
      t.string :access_node_mac
      t.timestamp :used_on
      t.timestamp :expired_on
      t.string :mac
      t.integer :income_bytes
      t.integer :outgoing

      t.timestamps
    end
  end
end
