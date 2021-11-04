class Api::V1::UsersController < ApplicationController
before_action :doorkeeper_authorize!
  before_action :set_user, only: %i[ show edit update destroy ]
  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only:[:webhook, :index, :create]
  def index
    @users = User.all
    render json:@users
  end

  def show
    render json: @user
  end


  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {status: 'SUCCESS',message: "User Successfully Created.",data:@user}, status: :ok
    else
      render json: {status: 'ERROR',message: "User not Created.",data:@user.errors}, status: :unprocessable_entity

    end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user
      @user.update(user_params)
      render json: {status: 'SUCCESS',message: "User Successfully Updated.",data:@user}, status: :ok
    else
      render json: {status: 'ERROR',message: "User not Updated.",data:@user.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
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
      params.permit(:email,:password,:password_confirmation,:role,:name)
    end

end
