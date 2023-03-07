class PizzaPrice < ApplicationRecord
  validates :value, :size, numericality: { greater_than: 0 }, presence: true

  belongs_to :pizza

  enum size: {
    small: 1,
    medium: 2,
    large: 3,
    extra_large: 4
  }
end
