class OrderItem < ApplicationRecord
  belongs_to:user
  belongs_to:product
  has_many:orders, dependent: :destroy
end
