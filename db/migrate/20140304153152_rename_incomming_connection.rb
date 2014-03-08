class RenameIncommingConnection < ActiveRecord::Migration
  def up
    rename_column :connections, :income_bytes, :incoming 
  end

  def down
  end
end
