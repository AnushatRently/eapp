module Api
  module V1
    class LikesController < Api::V1::ApplicationController

      def liked_products
        @user = User.find(params[:id])
        if (@user.id == current_user.id and @user.role == 1)
          @liked_products = @user.liked_products
          render json: @liked_products,only:[:id,:title,:description,:cost,:user_id,:available],status: :ok
        else
          render json: {status: "Unauthorized",message:"Invalid user"}, status: :unauthorized
        end
      end

      def liked_users
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
