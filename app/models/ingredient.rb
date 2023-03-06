class Ingredient < ApplicationRecord
  validates :name, :multiplier, presence: true
  validates :multiplier, numericality: { greater_than: 0 }
end
