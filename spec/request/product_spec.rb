require 'rails_helper'

RSpec.describe '/posts', type: :request do
before{
  @current_user=User.first_or_create!(email: 'anushseller@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')
}

  let(:valid_attributes) do
     {

       title: 'Test request',
       description: 'Test description ',
       cost: 400.0,
       user_id: @current_user,
       available: 30,
       about:"good",
       rating:3,

     }
   end

   let(:invalid_attributes) do
     {
       id: '50',
       title: 'Test request',
       description: 'Test description ',
       cost: 400.0,
       available: 30,
       about:"good",
       rating:3,

     }
   end

  describe 'GET /index' do
    it 'renders a response without auth' do
      get products_url
      expect(response).not_to be_successful
    end

    it 'renders a successful response' do
      sign_in @current_user
      get products_url
      expect(response).to be_successful
    end
  end

  

  describe "GET /edit" do
     it "renders edit path" do
       product = Product.new(valid_attributes)
       product.user_id = @current_user.id
       product.save
       get edit_product_path(product)
       expect(response).to_not be_successful

       sign_in @current_user
       product = Product.new(valid_attributes)
       product.user_id = @current_user.id
       product.save
       get edit_product_path(:prod_id=>product.id)
       expect(response).to be_successful
     end
   end

   describe "POST /create" do
    context "create with valid params" do
      it "creates new product" do
        sign_in @current_user
        expect {
          post products_path, params: { product: valid_attributes}
        }
      end
    end
    context "create with invalid params" do
      it "not creates new product" do
        expect {
          post products_path, params: { product: invalid_attributes}
        }
      end
    end
  end
   describe "DELETE /destroy" do
    it "deletes the product" do
      sign_in @current_user
      product = Product.new(valid_attributes)
      product.user_id = @current_user.id
      product.save
      expect{
        delete product_path(product)
      }
    end
    it "redirects to articles path after destroy" do
      sign_in @current_user
      product = Product.new(valid_attributes)
      product.user_id = @current_user.id
      product.save
      delete product_path(product)
      expect(response).to redirect_to(seller_console_index_url)
    end
  end

end
