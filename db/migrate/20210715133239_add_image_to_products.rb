class AddImageToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :img_presence, :integer
  end
end
