class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:order_items,dependent: :destroy
  has_many:ordereds, dependent: :destroy
  has_many:products, dependent: :destroy
  has_many:addresses, dependent: :destroy
  has_many:reviews, dependent: :destroy
  validates :role,:name , presence:true

  scope :locked,-> { where("locked_at != ?",nil)}

  devise :registerable, :lockable

  def self.authenticate(email, password)
      user = User.find_for_authentication(email: email)
      user&.valid_password?(password) ? user : nil
    end

  def role_as

    if role.to_i == 1
      "Buyer"
    else
      "Seller"
    end
  end

end
