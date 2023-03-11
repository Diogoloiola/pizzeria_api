class OrderItem < ApplicationRecord
  belongs_to :pizza
  belongs_to :order

  has_many :order_item_add_ingredients, inverse_of: :order_item
  has_many :add, class_name: 'Ingredient', through: :order_item_add_ingredients

  has_many :order_item_remove_ingredients, inverse_of: :order_item
  has_many :remove, class_name: 'Ingredient', through: :order_item_remove_ingredients

  accepts_nested_attributes_for :order_item_add_ingredients
  accepts_nested_attributes_for :order_item_remove_ingredients

  validates :size, presence: true

  enum size: {
    small: 1,
    medium: 2,
    large: 3,
    extra_large: 4
  }
end
