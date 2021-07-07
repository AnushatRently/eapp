class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
  belongs_to:user

  validates :title,:description,:cost,:img_url, presence:true
end
