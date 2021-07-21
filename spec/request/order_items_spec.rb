require 'rails_helper'
RSpec.describe 'Order_Items_Request', type: :request do
before{
  @current_user=User.first_or_create!(email: 'anushseller@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')
  @current_product=Product.first_or_create( title: 'Test Product', description: 'Test description ',cost: 400.0,user_id: @current_user.id,available: 30,about:"good",rating:3,img_presence:2)
}

let(:valid_attributes) do
   {
     id: '1',
     quantity: 2,
     user_id: @current_user,
     product_id: @current_product
   }
 end

 describe 'GET /index' do
   it 'renders a response without auth' do
     get order_items_path
     expect(response).not_to be_successful
   end

   it 'renders a successful response' do
     sign_in @current_user
     get order_items_path
     expect(response).to be_successful
   end

 end

 describe 'GET /show' do
   it 'renders a successful response' do
     sign_in @current_user
     order_item = OrderItem.new(valid_attributes)
     order_item.user_id=@current_user.id
     order_item.product_id=@current_product.id
     order_item.save
     get order_item_url(order_item)
     expect(response).to be_successful
   end
 end

 describe "GET /edit" do
    it "renders edit path" do
      sign_in @current_user
      order_item = OrderItem.new(valid_attributes)
      order_item.user_id = @current_user.id
      order_item.product_id=@current_product.id
      order_item.save
      get edit_order_item_path(order_item,:prod_id=>@current_product.id)
      expect(response).to be_successful
    end
  end

  describe "DELETE /destroy" do
   it "deletes the order_item" do
     sign_in @current_user
     order_item = OrderItem.new(valid_attributes)
     order_item.user_id = @current_user.id
     order_item.product_id=@current_product.id
     order_item.save
     expect{
       delete order_item_path(order_item)
     }
   end
   
 end



end
