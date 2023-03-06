class Ingredient < ApplicationRecord
  validates :name, :multiplier, presence: true
  validates :multiplier, numericality: { greater_than: 0 }

  has_many :pizza_default_ingredients, dependent: :destroy
  has_many :pizzas, through: :pizza_default_ingredients
end
