# frozen_string_literal: true

class PromotionalCode < ApplicationRecord
  validates :from, :to, numericality: { greater_than: 0 }, presence: true
  validates :code, :size, presence: true
  validates :to, comparison: { less_than: :from }

  belongs_to :target, class_name: 'Pizza'

  has_many :order_promotional_codes
  has_many :orders, through: :order_promotional_codes

  enum size: {
    small: 1,
    medium: 2,
    large: 3,
    extra_large: 4
  }
end
