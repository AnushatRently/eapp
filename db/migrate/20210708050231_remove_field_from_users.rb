class RemoveFieldFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :age, :integer
    remove_column :users, :phone_number, :string
    remove_column :users, :door_no, :string
    remove_column :users, :street, :string
    remove_column :users, :city, :string
    remove_column :users, :district, :string
    remove_column :users, :pincode, :integer
    remove_column :users, :state, :string
  end
end
