class RemoveAvailableFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :available, :integer
  end
end
