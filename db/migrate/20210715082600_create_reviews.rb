class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :product_id
      t.string :comment
      t.integer :rating

      t.timestamps
    end
  end
end
