require 'rails_helper'

RSpec.describe '/posts', type: :request do
before{
  @current_user=User.first_or_create!(email: 'anushseller@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')
}

  let(:valid_attributes) do
     {
       id: '2',
       title: 'Test request',
       description: 'Test description ',
       cost: 400.0,
       user_id: @current_user,
       available: 30,
       about:"good",
       rating:3,
       img_presence:2
     }
   end

   let(:invalid_attributes) do
     {
       id: '2',
       title: 'Test request',
       description: 'Test description ',
       cost: 400.0,
       available: 30,
       about:"good",
       rating:3,
       img_presence:2
     }
   end

  describe 'GET /index' do
    it 'renders a successful response' do
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = Product.new(valid_attributes)
      product.user_id=@current_user.id
      product.save
      get product_url(product)
      expect(response).to be_successful
    end
  end



   describe "DELETE /destroy" do
    it "deletes the product" do
      product = Product.new(valid_attributes)
      product.user = @current_user
      product.save
      expect{
        delete product_path(product)
      }
    end
    it "redirects to products path after destroy" do
      product = Product.new(valid_attributes)
      product.user = @current_user
      product.save
      delete product_path(product)
      expect(response).to redirect_to(seller_console_index_url)
    end
  end

end
