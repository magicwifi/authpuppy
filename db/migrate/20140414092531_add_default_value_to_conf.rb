class AddDefaultValueToConf < ActiveRecord::Migration
  def change
    change_column :confs, :checkinterval, :integer, :default => 60
    change_column :confs, :authinterval, :integer, :default => 120
    change_column :confs, :checktimeout, :integer, :default => 5
    change_column :confs, :httpmaxconn, :integer, :default => 10
  end
end
