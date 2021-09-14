class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum make_status: { cannot: 0, wait: 1, making: 2, maked: 3 }
end
