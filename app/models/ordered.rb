class Ordered < ApplicationRecord
  belongs_to:user
  belongs_to:order_item

end
