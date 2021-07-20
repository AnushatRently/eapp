class Product < ApplicationRecord
  has_many:order_items, dependent: :destroy
    has_many:reviews, dependent: :destroy
  belongs_to:user
  has_one_attached:img_url

  validates :title,:description,:cost,:available,:about,:img_presence, presence:true
  validates :cost,:available ,numericality:true
  validates :cost, numericality:{greater_than:0}

  def self.import(file)
    CSV.foreach(file.path,headers:true) do |row|
      Product.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
          csv << product.attributes.values_at(*column_names)
    end
  end
end

end
