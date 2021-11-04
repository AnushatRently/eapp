class LikesController < InheritedResources::Base

  private

    def like_params
      params.require(:like).permit(:product_id, :user_id)
    end

end
