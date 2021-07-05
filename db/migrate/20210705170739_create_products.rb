class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :code
      t.string :img_url

      t.timestamps
    end
  end
end
