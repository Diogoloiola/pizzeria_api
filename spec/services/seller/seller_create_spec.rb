require 'rails_helper'

RSpec.describe SellerService::CreateSeller, type: :service do
  let(:valid_attributes) do
    { name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Number.number(digits: 10).to_s,
      profile: %w[admin functionarty].sample }
  end

  let(:invalid_attributes) do
    { name: Faker::Name.name, email: Faker::Internet.email, profile: nil }
  end

  describe 'Criando um vendedor' do
    context 'Com parametros válidos' do
      it 'Novo vendedor' do
        response = subject.create_seller(valid_attributes)

        expect(response.created?).to be true
      end

      it 'Valida se o email de boas vindas foi enviado' do
        expect { subject.create_seller(valid_attributes) }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'Com parametros inválidos' do
      it 'Valida se o objeto retornado ainda é um Result' do
        response = subject.create_seller(invalid_attributes)

        expect(response).to be_a SellerService::CreateSeller::Result
      end

      it 'Valida se o objeto não foi criado' do
        response = subject.create_seller(invalid_attributes)

        expect(response.created?).to be false
      end

      it 'Valida se o email de boas vindas não foi enviado' do
        expect { subject.create_seller(invalid_attributes) }.to change { ActionMailer::Base.deliveries.count }.by(0)
      end
    end
  end
end
