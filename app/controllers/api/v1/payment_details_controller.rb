class Api::V1::PaymentDetailsController < ApplicationController
  before_action :doorkeeper_authorize!

  def all_payment_details
    @payment_details=PaymentDetail.all
    render json:@payment_details
  end

  def index
    @user = User.find(params[:id])
    @payment_details = @user.payment_details
    render json: @payment_details
  end

end
