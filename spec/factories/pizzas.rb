FactoryBot.define do
  factory :pizza do
    name { Faker::Food.sushi }
    value { Faker::Number.number(digits: 1) }
    active { true }
  end
end
