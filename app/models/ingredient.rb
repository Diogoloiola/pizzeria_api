class Ingredient < ApplicationRecord
  validates :name, :multiplier, presence: true
  validates :multiplier, numericality: { greater_than: 0 }

  has_many :pizza_default_ingredients, dependent: :destroy
  has_many :pizzas, through: :pizza_default_ingredients

  has_many :order_item_add_ingredients
  has_many :order_items, through: :order_item_add_ingredients
end
