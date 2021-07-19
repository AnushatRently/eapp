class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
    has_many:reviews, dependent: :destroy
  belongs_to:user
  has_one_attached:img_url

  validates :title,:description,:cost,:user_id,:available,:about,:img_presence, presence:true
  validates :cost,:available ,numericality:true
  validates :cost, numericality:{greater_than:0}

  def self.import(file)
    CSV.foreach(file.path,headers:true) do |row|
      Product.create! row.to_hash

    end
  end

end
