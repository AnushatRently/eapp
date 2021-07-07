class MyordersController < ApplicationController
  def index
    @ordereds = Ordered.all
  end
end
