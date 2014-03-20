class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :code
      t.string :message

      t.timestamps
    end
  end
end
