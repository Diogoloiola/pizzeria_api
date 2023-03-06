class PromotionalCode < ApplicationRecord
  validates :from, :to, numericality: { greater_than: 0 }, presence: true
  validates :code, :size, presence: true

  belongs_to :target, class_name: 'Pizza'

  enum size: {
    small: 1,
    medium: 2,
    large: 3,
    extra_large: 4
  }
end
