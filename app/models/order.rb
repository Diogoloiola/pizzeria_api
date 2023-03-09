class Order < ApplicationRecord
  has_many :order_promotional_codes
  has_many :promotional_codes, through: :order_promotional_codes

  has_many :items, class_name: 'OrderItem'

  enum status: {
    open: 0,
    running: 1,
    finished: 2
  }
end
