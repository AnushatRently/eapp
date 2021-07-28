module Api
  module V1
  class LikedProductsController < Api::V1::ApplicationController


  def index
    @user = User.find(params[:id])
    if (@user.id.to_i == current_user.id.to_i and @user.role == 1)
      @liked_products = @user.liked_products
      render json: @liked_products,only:[:id,:title,:description,:cost,:user_id,:available],status: :ok
    else
      render json: {status: "Unauthorized",message:"Invalid user"}, status: :unauthorized
    end
  end

end
end
end
