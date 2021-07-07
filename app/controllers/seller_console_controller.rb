class SellerConsoleController < ApplicationController
  def index
    @products=Product.all
  end
end
