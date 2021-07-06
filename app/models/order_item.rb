class OrderItem < ApplicationRecord
  belongs_to:user
  belongs_to:product
  has_many:ordereds, dependent: :destroy
end
