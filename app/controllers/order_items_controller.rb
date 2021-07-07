class OrderItemsController < ApplicationController
  def new
    @order_item=OrderItem.new
    @product=Product.find(params[:prod_id])
  end

  def edit
    @order_item =OrderItem.find(params[:id])
    @product=Product.find(params[:prod_id])
    @ordered=Ordered.find(params[:od])
  end

  def update
    order_item=OrderItem.update(order_item_params)

  end

  def show
    @order_item =OrderItem.find(params[:id])
  end

  def create
    order_item=OrderItem.create(order_item_params)
    redirect_to order_item_path(order_item)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id,:user_id,:quantity)
  end


end
