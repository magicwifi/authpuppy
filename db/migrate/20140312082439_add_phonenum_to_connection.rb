class AddPhonenumToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :phonenum, :string
  end
end
