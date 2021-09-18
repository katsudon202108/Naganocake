class Item < ApplicationRecord
  #belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart
  belongs_to :genre
  attachment :image
end
