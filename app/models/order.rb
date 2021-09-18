class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum payment_way: { card: 0, bank: 1 }
  enum status: { wait: 0, check: 1, making: 2, ready: 3, sent: 4 }

  with_options on: :create do |create|
    create.validates :postage, presence: true
    create.validates :total_price, presence: true
    create.validates :payment_way, presence: true
    create.validates :status, presence: true
    create.validates :name, presence: true
    create.validates :address, presence: true
    create.validates :postal_code, presence: true
  end

  with_options on: :confirm do |confirm|
    confirm.validates :name, presence: true
    confirm.validates :address, presence: true
    confirm.validates :postal_code, presence: true
    confirm.validates :payment_way, presence: true
  end
end
