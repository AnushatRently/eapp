class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :age
      t.string :phone_number
      t.string :door_no
      t.string :street
      t.string :city
      t.string :district
      t.integer :pincode
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
