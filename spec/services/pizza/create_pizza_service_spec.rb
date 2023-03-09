require 'rails_helper'

RSpec.describe PizzaService::CreatePizzaService, type: :service do # rubocop:disable Metrics/BlockLength: Block has too many lines.
  let(:valid_attributes) do
    { name: Faker::Food.sushi, value: 1, prices_attributes: [{ size: :small, value: 10 }] }
  end

  let(:invalid_attributes) do
    { name: Faker::Food.sushi, value: 1, prices_attributes: [{ size: :small, value: 0 }] }
  end

  describe 'Criando uma pizza' do
    context 'com parametros válidos' do
      it 'nova pizza' do
        response = subject.create_pizza(valid_attributes)
        expect(response.created?).to be true
      end

      it 'valida se o objeto é PizzaService::CreatePizzaService::Result' do
        response = subject.create_pizza(valid_attributes)
        expect(response).to be_a PizzaService::CreatePizzaService::Result
      end

      it 'valida se o objeto que é retornado nào contém erros' do
        expect(subject.create_pizza(valid_attributes).errors).to be_falsy
      end
    end

    context 'com parametros inválidos' do
      it 'não cria uma pizza' do
        response = subject.create_pizza(invalid_attributes)
        expect(response.created?).to be false
      end

      it 'tenta criar um pizza sem preços' do
        response = subject.create_pizza({ name: Faker::Food.sushi, value: 1, prices_attributes: [] })
        expect(response.created?).to be false

        expect(response.errors).to eq('Nao existe uma tabela de precos para essa pizza')
      end
    end
  end
end
