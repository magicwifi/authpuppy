class RenameAdminUser < ActiveRecord::Migration
  def up
    rename_column :admins, :user, :name 
  end

  def down
  end
end
