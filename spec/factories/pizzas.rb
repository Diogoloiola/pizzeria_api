FactoryBot.define do
  factory :pizza do
    name { Faker::Food.sushi }
    value { 10 }
    active { true }
  end
end
