class Api::V1::OrderedsController < ApplicationController
  before_action :set_ordered, only: %i[ show edit update destroy ]
  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only:[:webhook, :index, :create]
  def index
    @ordereds = Ordered.all
    respond_with @ordereds
  end

  def show
    respond_with  @ordered
  end


  # POST /ordereds or /ordereds.json
  def create
    @ordered = Ordered.build(ordered_params)

    if @ordered.save
      respond_with json: @ordered
    else
      respond_with error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /ordereds/1 or /ordereds/1.json
  def update
    if @ordered
      @ordered.update(ordered_params)
      respond_with json: {message: "User Successfully Updated."}, status:200
    else
      respond_with message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /ordereds/1 or /ordereds/1.json
  def destroy
    if @ordered
      @ordered.destroy
      respond_with json: {message: "User Successfully Deleted."}, status:200
    else
      respond_with message: {error: 'Unable to delete user.'}, status:400
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

end
