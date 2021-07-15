class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  respond_to :json
  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    respond_with json: @products,only:[:id,:title,:description,:cost,:user_id,:available]
  end

  def show
    respond_with json: @product
  end


  # POST /products or /products.json
  def create
    @product = product.new(product_params)

    if @product.save
      respond_with json: @product
    else
      respond_with error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product
      @product.update(product_params)
      respond_with json: {message: "User Successfully Updated."}, status:200
    else
      respond_with message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    if @product
      @product.destroy
      respond_with json: {message: "User Successfully Deleted."}, status:200
    else
      respond_with message: {error: 'Unable to delete user.'}, status:400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:user_id, :product_id, :total)
    end

end
