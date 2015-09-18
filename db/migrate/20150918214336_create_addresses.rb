class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
