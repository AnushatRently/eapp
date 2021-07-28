module Api
  module V1
    class LikesController < Api::V1::ApplicationController

      def liked_products
        user = User.find(params[:id])
        if (user.id == current_user.id and user.role == 1)
          liked_products = user.liked_products
          render json: liked_products,only:[:id,:title,:description,:cost,:user_id,:available],status: :ok
        else
          if current_user.role==1
            render json: {status: "Unauthorized",message:"You are not authorised to access liked products of another customer"}, status: :unauthorized
          else
            render json: {status: "Unauthorized",message:"Sellers are not authorised for this feature"}, status: :unauthorized
          end
        end
      end

      def liked_users
        product = Product.find(params[:id])
        if (product.user_id == current_user.id and current_user.role==0)
          liked_users = product.liked_users
          render json: liked_users
        else
          if current_user.role==0
            render json: {status: "Unauthorized",message: "You are not authorised to access the liked customers of other sellers products"}, status: :unauthorized
          else
            render json: {status: "Unauthorized",message: "Buyers are not authorized for this feature"}, status: :unauthorized
          end
        end


    end

    end
  end
end
