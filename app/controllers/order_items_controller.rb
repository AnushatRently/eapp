class OrderItemsController < ApplicationController

  before_action :authenticate_user!
  def new
    @order_item=OrderItem.new
    @product=Product.find(params[:prod_id])
    @avg=Review.where(product_id: params[:prod_id]).average(:rating)
    @reviews=Review.all
  end

  def edit
    @order_item =OrderItem.find(params[:id])
    @product=Product.find(params[:prod_id])
    @od=params[:od]
    if (params[:od].to_i >0)
    @ordered=Ordered.find(params[:od])
    end
  end

  def update
    order_item=OrderItem.update(order_item_params)

  end

  def show
    @order_item =OrderItem.find(params[:id])
  end

  def create
    order_item=OrderItem.create(order_item_params)
    redirect_to order_item_path(order_item.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id,:user_id,:quantity)
  end


end
