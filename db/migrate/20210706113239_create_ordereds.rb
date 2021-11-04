class CreateOrdereds < ActiveRecord::Migration[6.1]
  def change
    create_table :ordereds do |t|
      t.string :user_id
      t.string :order_item_id
      t.decimal :total

      t.timestamps
    end
  end
end
