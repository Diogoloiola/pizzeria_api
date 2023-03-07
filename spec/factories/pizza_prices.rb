FactoryBot.define do
  factory :pizza_price do
    size { 1 }
    value { '9.99' }
    pizza { nil }
  end
end
