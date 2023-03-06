class Pizza < ApplicationRecord
  validates :name, :value, presence: true

  validates :value, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
end
