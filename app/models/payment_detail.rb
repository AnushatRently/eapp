class PaymentDetail < ApplicationRecord
  has_many:user_payment_details
  has_many:users,through: :user_payment_details
end
