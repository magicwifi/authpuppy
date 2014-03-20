class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :password_digest
      t.string :password_token

      t.timestamps
    end
  end
end
