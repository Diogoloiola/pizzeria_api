class Pizza < ApplicationRecord
  validates :name, :value, presence: true

  validates :value, numericality: { greater_than: 0 }
  validates :name, uniqueness: true

  has_many :pizza_default_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_default_ingredients

  has_many :prices, class_name: 'PizzaPrice'

  accepts_nested_attributes_for :prices
end
