# frozen_string_literal: true

Ingredient.destroy_all
Pizza.destroy_all
PromotionalCode.destroy_all
Seller.destroy_all
Discount.destroy_all
Order.destroy_all

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

Seller.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              cpf: CPF.new(CPF.generate).formatted,
              profile: %w[admin functionarty].sample,
              password: Faker::Number.number(digits: 10).to_s)

Discount.create(deduction_in_percent: 5, code: SecureRandom.uuid.slice(0, 5))

order = Order.new(
  discount_code: Discount.last.id,
  seller_id: Seller.last.id,
  items_attributes: [{
    pizza_id: Pizza.last.id,
    size: :small
  }]
)

order.save!
