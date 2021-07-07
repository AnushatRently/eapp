class OrderItem < ApplicationRecord
  validates :quantity, presence:true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  belongs_to:user
  belongs_to:product
  has_many:ordereds, dependent: :destroy
end
