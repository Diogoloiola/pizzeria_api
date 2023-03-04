FactoryBot.define do
  factory :seller do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { CPF.new(CPF.generate).formatted }
    profile { %w[admin functionarty].sample }
    password { Faker::Number.number(digits: 10).to_s }
  end
end
