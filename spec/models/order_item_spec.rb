require 'rails_helper'

RSpec.describe OrderItem,type: :model do
  current_user=User.first_or_create!(email: 'anush@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')
  current_product=Product.first_or_create!(title:"product",description:"good",cost:300,user_id:current_user.id,available:30,about:"good",rating:3,img_presence:0)

  before do
    @order=OrderItem.new(user_id:current_user.id,product_id:current_product.id,quantity:10)
  end

  it "has a quantity" do
    @order.quantity = ""
    expect(@order).to_not be_valid
    @order.quantity = 10
    expect(@order).to be_valid
  end

  it "has numerical quantity greater than 0" do
    @order.quantity = "hello"
    expect(@order).to_not be_valid
    @order.quantity = 0
    expect(@order).to_not be_valid
    @order.quantity = 10
    expect(@order).to be_valid
  end

end
