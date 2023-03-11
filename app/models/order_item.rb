class OrderItem < ApplicationRecord
  belongs_to :pizza
  belongs_to :order

  has_many :order_item_add_ingredients
  has_many :add, class_name: 'Ingredient', through: :order_item_add_ingredients
end