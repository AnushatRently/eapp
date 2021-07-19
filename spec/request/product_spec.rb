require 'rails_helper'

RSpec.describe '/posts', type: :request do

  current_user=User.first_or_create!(email: 'anush@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')


  describe 'GET /index' do
    it 'renders a successful response' do
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = Product.new(title:"product",description:"good",cost:300,user_id:current_user.id,available:30,about:"good",rating:3,img_presence:0)
      product.save
      get product_url(product)
      expect(response).to be_successful
    end
  end

end
