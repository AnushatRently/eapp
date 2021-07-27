class Api::V1::LikedUsersController < ApplicationController
  before_action :doorkeeper_authorize!



  def index
      @product = Product.find(params[:id])
      if @product.user_id == 2
        @liked_users = @product.liked_users
        render json: @liked_users
      else
        render json: {status: 'ERROR',message: "Invalid user"}, status: :not_found
      end

end

end
