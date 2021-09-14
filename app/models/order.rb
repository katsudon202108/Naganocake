class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  
  enum payment_way: { card: 0, bank: 1 }
  enum status: { wait: 0, check: 1, making: 2, ready: 3, sent: 4 }
end
