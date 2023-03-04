require 'rails_helper'
require 'byebug'

RSpec.describe SellerService::CreateSeller, type: :service do
  let(:valid_attributes) do
    { name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Number.number(digits: 10).to_s,
      profile: %w[admin functionarty].sample }
  end

  describe 'Criando um vendedor' do
    context 'Com parametros válidos' do
      it 'Novo vendedor' do
        service = SellerService::CreateSeller.new

        response = service.create_seller(valid_attributes)

        expect(response.created?).to be true
      end

      it 'Valida se o email de boas vindas foi enviado' do
        service = SellerService::CreateSeller.new

        expect { service.create_seller(valid_attributes) }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
