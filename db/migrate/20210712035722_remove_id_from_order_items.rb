class RemoveIdFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :order_id, :integer
  end
end
