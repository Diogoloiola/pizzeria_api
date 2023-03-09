class OrderItemAddIngredient < ApplicationRecord
  belongs_to :order_item
  belongs_to :add, class_name: 'Ingredient'
end
