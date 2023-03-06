# frozen_string_literal: true

Ingredient.destroy_all
Pizza.destroy_all
PromotionalCode.destroy_all

ingredients = [
  { name: 'Onions', multiplier: 1 },
  { name: 'Cheese', multiplier: 2 },
  { name: 'Olives', multiplier: 2.5 }
]

ingredients.each { |ingredient| Ingredient.create!(ingredient) }

pizzas = [
  { name: 'Margherita', value: 5 },
  { name: 'Salami', value: 6 },
  { name: 'Tonno', value: 8 }
]

pizzas.each { |pizza| Pizza.create! pizza }

Pizza.find_each do |pizza|
  Ingredient.find_each do |ingredient|
    PizzaDefaultIngredient.create! pizza_id: pizza.id, ingredient_id: ingredient.id
  end
end

PromotionalCode.create!(code: SecureRandom.uuid.slice(0, 5), from: 2, to: 1, target_id: Pizza.last.id, size: 1)
