class RenameInUserTable < ActiveRecord::Migration[6.1]
  def change
    rename_column(:products, :code, :cost)
  end
end
