class AddAboutToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :about, :string
  end
end
