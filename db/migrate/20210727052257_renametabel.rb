class Renametabel < ActiveRecord::Migration[6.1]
  def change
    rename_table :_user_payment_details,:user_payment_details
  end
end
