class SellerConsoleController < ApplicationController
  before_action :authenticate_user!
  def index
    @products=Product.all
    @addresses_has=Address.find_by(user_id:current_user)
    @addresses=Address.all
  end
end
