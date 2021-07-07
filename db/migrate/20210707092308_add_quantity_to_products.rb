class AddQuantityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :available, :integer
  end
end
