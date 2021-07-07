class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:order_items,dependent: :destroy
  has_many:ordereds, dependent: :destroy
  has_many:products, dependent: :destroy
  

  validates :email,:role,:name,:age,:phone_number,:door_no,:street,:city,:state,:pincode,:district, presence:true

  validates :phone_number, numericality: true
  validates :phone_number,length:{is:10, message:" should be of 10 digits"}
end
