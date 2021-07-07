class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
  belongs_to:user
  has_one_attached:img_url

  validates :title,:description,:cost,:available, presence:true

end
