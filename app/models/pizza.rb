class Pizza < ApplicationRecord
  validates :name, :value, presence: true

  validates :value, numericality: { greater_than: 0 }
  validates :name, uniqueness: true

  has_many :pizza_default_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_default_ingredients

  has_many :prices, class_name: 'PizzaPrice', dependent: :destroy
  has_many :order_items, dependent: :destroy

  has_many :promotional_codes, class_name: 'PromotionalCode', foreign_key: :target_id, dependent: :destroy

  accepts_nested_attributes_for :prices
end
