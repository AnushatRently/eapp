class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
  belongs_to:user
  has_one_attached:img_url

  validates :title,:description,:cost,:available, presence:true

  def self.reduce_count
    @product=Product.find(6)
    @product.available=@product.available.to_i - 1
  end

end
