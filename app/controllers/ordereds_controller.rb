class OrderedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ordered, only: %i[ show update destroy set_available]
  after_action :set_available,only:%i[create update]
  # GET /ordereds or /ordereds.json
  def index
    @ordereds = Ordered.all
  end

  # GET /ordereds/1 or /ordereds/1.json
  def show
    @id=@ordered.order_item.product_id
    @user=@ordered.user
    @addresses=Address.all
  end

  # GET /ordereds/new
  def new
    @ordered = Ordered.new
    @order_item=OrderItem.find(params[:order_id])
    session[:order_id]=params[:order_id]
    @total=(@order_item.product.cost).to_i * @order_item.quantity.to_i


  end

  # GET /ordereds/1/edit
  def edit
    @ordered = Ordered.find(params[:id])
    @order_item=OrderItem.find(@ordered.order_item.id)
    @total=(@order_item.product.cost).to_i * @order_item.quantity.to_i
  end

  # POST /ordereds or /ordereds.json
  def create
    @ordered = Ordered.new(ordered_params)
    @order_item=OrderItem.find(session[:order_id])
    respond_to do |format|
      if @ordered.save
        format.html { redirect_to @ordered, notice: "Ordered was successfully created." }
        format.json { render :show, status: :created, location: @ordered }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordered.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordereds/1 or /ordereds/1.json
  def update
    respond_to do |format|
      if @ordered.update(ordered_params)
        format.html { redirect_to @ordered, notice: "Ordered was successfully updated." }
        format.json { render :show, status: :ok, location: @ordered }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordered.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordereds/1 or /ordereds/1.json
  def destroy
    @ordered.destroy
    respond_to do |format|
      format.html { redirect_to ordereds_url, notice: "Ordered was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered
      @ordered = Ordered.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordered_params
      params.require(:ordered).permit(:user_id, :order_item_id, :total)
    end

    def set_available
      @product=Product.find(@ordered.order_item.product_id)
      Product.update(@product.id,available:(@product.available - @ordered.order_item.quantity))
    end

end
