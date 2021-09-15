class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart
end
