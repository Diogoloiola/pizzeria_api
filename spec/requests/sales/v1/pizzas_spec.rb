require 'rails_helper'

RSpec.describe '/sales/v1/pizzas', type: :request do
  let(:valid_attributes) do
    { name: Faker::Food.sushi, value: 1 }
  end

  let(:invalid_attributes) do
    { name: Faker::Food.sushi, value: 0 }
  end

  let(:valid_headers) do
    auth_header(create(:seller))
  end

  describe 'GET' do
    it 'retorna todas as pizzas' do
      Pizza.create! valid_attributes
      get sales_v1_pizzas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'retorna uma pizza baseada no id' do
      pizza = Pizza.create! valid_attributes
      get sales_v1_pizza_url(pizza), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'Com parametros válidos' do
      it 'cria uma nova pizza' do
        expect do
          post sales_v1_pizzas_url,
               params: { pizza: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Pizza, :count).by(1)
      end

      it 'Valida se pizza o status que foi retorna é de criado' do
        post sales_v1_pizzas_url,
             params: { pizza: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Com parametros inválidos' do
      it 'não cria a pizza' do
        expect do
          post sales_v1_pizzas_url,
               params: { pizza: invalid_attributes }, as: :json
        end.to change(Pizza, :count).by(0)
      end

      it 'valida se é retornado um erro ao criar uma pizza com parametros inválidos' do
        post sales_v1_pizzas_url,
             params: { pizza: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'Com parametos válidos' do
      let(:new_attributes) do
        { name: Faker::Food.sushi }
      end

      it 'valida se o nome da pizza realmente foi atualizado' do
        pizza = Pizza.create! valid_attributes
        patch sales_v1_pizza_url(pizza),
              params: { pizza: new_attributes }, headers: valid_headers, as: :json
        pizza.reload
        expect(pizza.name).to eql(pizza.name)
      end

      it 'valida se o retorno da atualizacao é ok' do
        pizza = Pizza.create! valid_attributes
        patch sales_v1_pizza_url(pizza),
              params: { pizza: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Com parametros inválidos' do
      it 'renderiza a messagem de error com os parametros inválidos' do
        pizza = Pizza.create! valid_attributes
        patch sales_v1_pizza_url(pizza),
              params: { pizza: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'Delete uma pizza baseado no id' do
      pizza = Pizza.create! valid_attributes
      expect do
        delete sales_v1_pizza_url(pizza), headers: valid_headers, as: :json
      end.to change(Pizza, :count).by(-1)
    end
  end
end
