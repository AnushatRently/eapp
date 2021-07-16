class OrderItem < ApplicationRecord
  validates :quantity, numericality:{greater_than: 0, message:"Quantity Should be greater than 0"},presence:true
  belongs_to:user
  belongs_to:product
  has_many:ordereds, dependent: :destroy
end
