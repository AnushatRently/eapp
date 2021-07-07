class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end


  # POST /products or /products.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @user
      @user.update(user_params)
      render json: {message: "User Successfully Updated."}, status:200
    else
      render message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    if @user
      @user.destroy
      render json: {message: "User Successfully Deleted."}, status:200
    else
      render message: {error: 'Unable to delete user.'}, status:400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email , :password , :current_password,:password_confirmation , :role,:name, :age, :phone_number,:door_no,:street,:city, :district, :pincode, :state )
    end

end
