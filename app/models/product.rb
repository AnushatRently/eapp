class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
    has_many:reviews, dependent: :destroy
  belongs_to:user
  has_one_attached:img_url

  validates :title,:description,:cost,:available, presence:true

  def self.import(file)
    CSV.foreach(file.path,headers:true) do |row|
      Product.create! row.to_hash

    end
  end

end
