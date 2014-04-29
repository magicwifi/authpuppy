class AddDeveloperToAccessNode < ActiveRecord::Migration
  def change
    add_column :access_nodes, :developer, :string
  end
end
