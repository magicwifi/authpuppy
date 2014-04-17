class RenameTablesConfsColumnChecktimeoutToClienttimeout < ActiveRecord::Migration
  def up
    rename_column :confs, :checktimeout, :clienttimeout
  end

  def down
  end
end
