class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
      t.string :name
      t.string :phone_number
      t.string :bank_name
      t.string :card_number

      t.timestamps
    end
  end
end
