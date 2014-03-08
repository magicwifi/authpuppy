class CreateAccessNodes < ActiveRecord::Migration
  def change
    create_table :access_nodes do |t|
      t.string :name
      t.string :mac
      t.integer :sys_uptime
      t.integer :sys_upload
      t.integer :sys_memfree
      t.string :remote_addr
      t.integer :update_time
      t.datetime :last_seen
      t.string :redirect_url
      t.string :portal_url

      t.timestamps
    end
  end
end
