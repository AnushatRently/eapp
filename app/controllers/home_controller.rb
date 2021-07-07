class HomeController < ApplicationController




  def index
    if current_user.role==1
     redirect_to shops_path
   else
     redirect_to seller_console_index_path
   end
  end
end
