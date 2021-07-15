class AddressesController < ApplicationController

  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /addresss or /addresss.json
  def index
    @addresses = Address.all
  end

  # GET /addresss/1 or /addresss/1.json
  def show
  end

  # GET /addresss/new
  def new
    @address = Address.new
  end

  # GET /addresss/1/edit
  def edit
  end

  # POST /addresss or /addresss.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: "address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresss/1 or /addresss/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to root_path, notice: "address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresss/1 or /addresss/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to seller_console_index_path, notice: "address was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:name, :age, :phone_number, :door_no, :street, :city, :district, :pincode, :state, :user_id)
    end

end
