FactoryBot.define do
  factory :discount do
    deduction_in_percent { 1.5 }
    code { SecureRandom.uuid.slice(0, 5) }
    active { true }
  end
end
