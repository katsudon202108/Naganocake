class Item < ApplicationRecord
  #belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart
  belongs_to :genre
  attachment :image

  # 税込価格（軽減税率適用 8%で計算）
  def add_tax_price
    (self.price * 1.08).floor
  end
  # topページ新着商品表示
  scope :latest, -> { order(id: :desc) }
end
