require 'rails_helper'

RSpec.describe Address,type: :model do

  current_user=User.first_or_create!(email: 'anush@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')

  before do
    @address=Address.new(user_id:current_user.id,name:"Anush",age:21,phone_number:8610183918,door_no:168,street:"Iyyanthottam",city:"sathy",district:"erode",state:"tamilnadu",pincode:638454)
  end

  it "has a name" do
    @address.name = ""
    expect(@address).to_not be_valid
    @address.name = "address"
    expect(@address).to be_valid
  end

  it "has a age" do
    @address.age = ""
    expect(@address).to_not be_valid
    @address.age = 21
    expect(@address).to be_valid
  end

  it "has numerical age" do
    @address.age = "Hello"
    expect(@address).to_not be_valid
    @address.age = 21
    expect(@address).to be_valid
  end

  it "has a door_no" do
    @address.door_no = ""
    expect(@address).to_not be_valid
    @address.door_no = "168"
    expect(@address).to be_valid
  end

  it "has a street" do
    @address.street = ""
    expect(@address).to_not be_valid
    @address.street = "Iyyanthottam"
    expect(@address).to be_valid
  end

  it "has a city" do
    @address.city = ""
    expect(@address).to_not be_valid
    @address.city = "Sathy"
    expect(@address).to be_valid
  end

  it "has a district" do
    @address.district = ""
    expect(@address).to_not be_valid
    @address.district = "Erode"
    expect(@address).to be_valid
  end

  it "has a state" do
    @address.state = ""
    expect(@address).to_not be_valid
    @address.state = "Tamil Nadu"
    expect(@address).to be_valid
  end

  it "has a pincode" do
    @address.pincode = ""
    expect(@address).to_not be_valid
    @address.pincode = 638454
    expect(@address).to be_valid
  end

  it "has numerical pincode" do
    @address.pincode = "hello"
    expect(@address).to_not be_valid
    @address.pincode = 638454
    expect(@address).to be_valid
  end

  it "has a phone_number" do
    @address.phone_number = ""
    expect(@address).to_not be_valid
    @address.phone_number = 8610183918
    expect(@address).to be_valid
  end

  it "has numerical phone_number" do
    @address.phone_number = "Hello"
    expect(@address).to_not be_valid
    @address.phone_number = 8610183918
    expect(@address).to be_valid
  end

  it "has 10 digit phone_number" do
    @address.phone_number = 18610183918
    expect(@address).to_not be_valid
    @address.phone_number = 8610183918
    expect(@address).to be_valid
  end


end
