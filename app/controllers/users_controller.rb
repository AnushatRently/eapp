class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  respond_to :json
  protect_from_forgery with: :null_session

  def index
    respond_with json:{user:User.all}
  end

  def show
    respond_to json: @user
  end


  # POST /products or /products.json
  def create
    @user = User.new(user_params)

    if @user.save
      respond_to json: @user
    else
      respond_to error: {error: 'Unable to create user.'}, status:400
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @user
      @user.update(user_params)
      respond_to json: {message: "User Successfully Updated."}, status:200
    else
      respond_to message: {error: 'Unable to Update user.'}, status:400
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    if @user
      @user.destroy
      respond_to json: {message: "User Successfully Deleted."}, status:200
    else
      respond_to message: {error: 'Unable to delete user.'}, status:400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email , :password , :current_password,:password_confirmation , :role)
    end

end
