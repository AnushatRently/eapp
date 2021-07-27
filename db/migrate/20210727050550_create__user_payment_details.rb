class CreateUserPaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :_user_payment_details do |t|
      t.integer :user_id
      t.integer :payment_detail_id

      t.timestamps
    end
  end
end
