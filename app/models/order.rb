class Order < ApplicationRecord
  has_many :order_promotional_codes
  has_many :promotional_codes, through: :order_promotional_codes

  has_many :itens, class_name: 'OrderItem', dependent: :destroy

  belongs_to :seller, optional: true

  accepts_nested_attributes_for :itens

  enum status: {
    open: 0,
    running: 1,
    finished: 2
  }
end
