class RenameAccessNodeColumn < ActiveRecord::Migration
  def up
    rename_column :access_nodes, :update_config, :configflag
  end

  def down
  end
end
