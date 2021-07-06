class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :phone_number, :string
    add_column :users, :door_no, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :pincode, :integer
    add_column :users, :state, :string
  end
end
