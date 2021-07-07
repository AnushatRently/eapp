class Api::V1::OrderedsController < ApplicationController
  before_action :set_ordered, only: %i[ show edit update destroy ]

  def index
    @ordereds = Ordered.all
    render json: @ordereds
  end

  def show
    render json: @ordered
  end


  # POST /ordereds or /ordereds.json
  def create
    @ordered = ordered.new(ordered_params)

    if @ordered.save
      render json: @ordered
    else
      render error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /ordereds/1 or /ordereds/1.json
  def update
    if @ordered
      @ordered.update(ordered_params)
      render json: {message: "User Successfully Updated."}, status:200
    else
      render message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /ordereds/1 or /ordereds/1.json
  def destroy
    if @ordered
      @ordered.destroy
      render json: {message: "User Successfully Deleted."}, status:200
    else
      render message: {error: 'Unable to delete user.'}, status:400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered
      @ordered = ordered.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordered_params
      params.require(:ordered).permit(:user_id, :order_item_id, :total)
    end

end
