require 'rails_helper'

RSpec.describe "Api::V1::usersController" , type: :request do
    let(:oauth_app) {
        Doorkeeper::Application.create!(
          name: "RSpec-client",
          redirect_uri: ""
        )
      }
    let(:access_token)  { Doorkeeper::AccessToken.create!(application: oauth_app) }
    let(:authorization) { "Bearer #{access_token.token}" }

    describe "GET /index" do
        it "renders all users" do
            get '/api/v1/users',headers: {:Authorization => authorization}
            expect(response).to be_successful
        end
        it "without token" do
            get '/api/v1/users'
            expect(response).to_not be_successful
        end
    end

    describe "GET /show" do
        it "renders user's articles" do
            @user=User.new(email: 'anushseller@gmail.com',password: "anushk",password_confirmation:"anushk",role:0,name:'Anush')
            @user.save
            get api_v1_user_path(id:@user.id),headers: {:Authorization => authorization}
            expect(response).to be_successful
        end
    end

    

end
