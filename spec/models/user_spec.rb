require 'rails_helper'

RSpec.describe User,type: :model do
  dummy_pwd = 'password'
    dummy_email = 'tester@example.com'


    before do
      @user = User.new(email: dummy_email,password: dummy_pwd,password_confirmation:dummy_pwd,role:1,name:'Anush')
      end



      it "has a email" do
        @user.email = ""
        expect(@user).to_not be_valid
        @user.email = dummy_email
        expect(@user).to be_valid
      end

      it "has valid format" do
      @user.email = "admin..."
      expect(@user).to_not be_valid
      @user.email = dummy_email
      expect(@user).to be_valid
    end

    it "has password at least 6 characters long" do
      @user.password="pass"
      expect(@user).to_not be_valid
      @user.password=dummy_pwd
      expect(@user).to be_valid
    end

    it "has a password confirmation" do
      @user.password_confirmation = "password1"
      expect(@user).to_not be_valid
      @user.password_confirmation = dummy_pwd
      expect(@user).to be_valid
    end

    it "has a name" do
      @user.name = ""
      expect(@user).to_not be_valid
      @user.name = 'Anush'
      expect(@user).to be_valid
    end

    it "has a role" do
      @user.role = ""
      expect(@user).to_not be_valid
      @user.role = 1
      expect(@user).to be_valid
    end

    

    end
