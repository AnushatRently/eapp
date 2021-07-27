class Like < ApplicationRecord
  belongs_to:user
  belongs_to:product
  belongs_to:liked_product,foreign_key: :product_id ,class_name:"Product"
  belongs_to:liked_user,foreign_key: :user_id ,class_name:"User"
end
