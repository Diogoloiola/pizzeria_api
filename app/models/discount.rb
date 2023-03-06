class Discount < ApplicationRecord
  validates :code, presence: true
  validates :deduction_in_percent, numericality: { greater_than: 0 }, presence: true
end
