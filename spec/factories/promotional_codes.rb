FactoryBot.define do
  factory :promotional_code do
    code { "MyString" }
    pizza { nil }
    size { 1 }
    from { 1 }
    to { 1 }
  end
end
