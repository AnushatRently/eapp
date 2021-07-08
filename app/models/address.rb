class Address < ApplicationRecord
  belongs_to:user

  validates :name,:age,:phone_number,:door_no,:street,:city,:state,:pincode,:district, presence:true

  validates :phone_number, numericality: true
  validates :phone_number,length:{is:10, message:" should be of 10 digits"}
end
