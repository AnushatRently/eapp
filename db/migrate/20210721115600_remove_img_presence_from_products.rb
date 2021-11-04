class RemoveImgPresenceFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :img_presence, :integer
  end
end
