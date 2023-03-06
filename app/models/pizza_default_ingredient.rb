class PizzaDefaultIngredient < ApplicationRecord
  belongs_to :pizza, optional: false
  belongs_to :ingredient, optional: false
end
