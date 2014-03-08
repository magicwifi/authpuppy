class AddDeviceToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :device, :string
  end
end
