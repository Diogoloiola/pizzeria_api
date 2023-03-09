FactoryBot.define do
  factory :order do
    state { 1 }
    discount_code { 'MyString' }
  end
end
