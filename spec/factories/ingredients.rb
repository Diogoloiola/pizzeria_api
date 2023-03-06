FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.sushi }
    multiplier { 1.5 }
    active { true }
  end
end
