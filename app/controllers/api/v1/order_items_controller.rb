class Api::V1::OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  
  def index
    @order_items = OrderItem.all
    render json:@order_items
  end

  def show
    render json:@order_item
  end


  # POST /order_items or /order_items.json
  def create
    @order_item = order_item.new(order_item_params)

    if @order_item.save
      respond_with json: @order_item
    else
      render error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    if @order_item
      @order_item.update(order_item_params)
      render json: {message: "User Successfully Updated."}, status:200
    else
      render message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    if @order_item
      @order_item.destroy
      render json: {message: "User Successfully Deleted."}, status:200
    else
      render message: {error: 'Unable to delete user.'}, status:400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = order_item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:user_id, :order_item_id, :total)
    end
end
