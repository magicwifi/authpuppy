class AddAuthserverToConf < ActiveRecord::Migration
  def change
    add_column :confs, :authserver, :string
  end
end
