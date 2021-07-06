class Order < ApplicationRecord
  belongs_to:order_items
  belongs_to:user
end
