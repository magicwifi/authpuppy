class AddDefaultValueToConnection < ActiveRecord::Migration
  def change
    change_column_default :connections, :incoming, 0
    change_column_default :connections, :outgoing, 0
  end

end
