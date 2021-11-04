
module Api
  module V1
  class LikedUsersController < Api::V1::ApplicationController

  def index
      @product = Product.find(params[:id])
      if @product.user_id == current_user.id
        @liked_users = @product.liked_users
        render json: @liked_users
      else
        render json: {status: "Unauthorized",message: "Invalid User"}, status: :unauthorized
      end
end

end

end

end
