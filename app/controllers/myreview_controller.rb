class MyreviewController < ApplicationController
  def index
    @reviews = Review.all
    @id=params[:id]
    @review_user=Review.find_by(user_id:current_user)
    @review_product=Review.find_by(product_id:params[:id])
    @product=Product.find(params[:id])
  end

  def show
  end
end
