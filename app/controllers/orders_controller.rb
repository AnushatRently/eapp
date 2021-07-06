class OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
    @order_item=OrderItem.find(params[:order_id])
  end
  def new
    @order=Order.new
    @order_item=OrderItem.find(params[:order_id])
    @total=(@order_item.product.cost).to_i * @order_item.quantity.to_i
  end



  def create
    order=Order.create(order_params)
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:total,:order_id)
  end

end
