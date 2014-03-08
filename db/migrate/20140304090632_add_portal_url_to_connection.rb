class AddPortalUrlToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :portal_url, :string
  end
end
