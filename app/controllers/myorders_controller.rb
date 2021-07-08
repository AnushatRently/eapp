class MyordersController < ApplicationController
    before_action :authenticate_user!
  def index
    @ordereds = Ordered.all
    
  end
end
