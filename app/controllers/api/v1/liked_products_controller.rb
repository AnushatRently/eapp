class Api::V1::LikedProductsController < ApplicationController
  before_action :doorkeeper_authorize!


  def index
    @user = User.find(params[:id])
    if @user.role == 1
      @liked_products = @user.liked_products
      render json: @liked_products,only:[:id,:title,:description,:cost,:user_id,:available],status: :ok
    else
      render json: {status: 'ERROR',message: "Invalid user"}, status: :not_found
    end
  end

end
