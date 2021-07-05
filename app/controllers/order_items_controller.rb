class OrderItemsController < ApplicationController
  def new
    @order_item=OrderItem.new
  end

  def create
    order_item=OrderItem.create(order_item_params)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id,:user_id,:quantity)
  end
end
