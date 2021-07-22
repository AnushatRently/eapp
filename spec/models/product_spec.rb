require 'rails_helper'

RSpec.describe Product,type: :model do

  current_user=User.first_or_create!(email: 'anush@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')

  before do
    @product=Product.new(title:"product",description:"good",cost:300,user_id:current_user.id,available:30,about:"good",rating:3)
  end


  it "has a title" do
    @product.title = ""
    expect(@product).to_not be_valid
    @product.title = "product"
    expect(@product).to be_valid
  end

  it "has a description" do
    @product.description = ""
    expect(@product).to_not be_valid
    @product.description = "good"
    expect(@product).to be_valid
  end

  it "has a cost" do
    @product.cost = ""
    expect(@product).to_not be_valid
    @product.cost = 100
    expect(@product).to be_valid
  end

  it "has a available" do
    @product.available = ""
    expect(@product).to_not be_valid
    @product.available = 50
    expect(@product).to be_valid
  end

  it "has a about" do
    @product.about = ""
    expect(@product).to_not be_valid
    @product.about = "good"
    expect(@product).to be_valid
  end



  it "has numerical cost" do
    @product.cost = "Hello"
    expect(@product).to_not be_valid
    @product.cost = 50
    expect(@product).to be_valid
  end

  it "has numerical available" do
    @product.available = "Hello"
    expect(@product).to_not be_valid
    @product.available = 50
    expect(@product).to be_valid
  end

  it "has cost greater than 0" do
    @product.cost = 0
    expect(@product).to_not be_valid
    @product.cost = 50
    expect(@product).to be_valid
  end

end
