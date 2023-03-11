class OrderItemRemoveIngredient < ApplicationRecord
  belongs_to :order_item
  belongs_to :remove, class_name: 'Ingredient'
end
