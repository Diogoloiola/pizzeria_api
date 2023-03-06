require 'rails_helper'

RSpec.describe '/sales/v1/ingredients', type: :request do
  let(:valid_attributes) do
    { name: 'Onions', multiplier: 1 }
  end

  let(:invalid_attributes) do
    { name: 'Onions', multiplier: 0 }
  end

  let(:valid_headers) do
    auth_header(create(:seller))
  end

  describe 'GET /index' do
    it 'apresenta uma resposta bem-sucedida' do
      Ingredient.create! valid_attributes
      get sales_v1_ingredients_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'apresenta uma resposta bem-sucedida' do
      ingredient = Ingredient.create! valid_attributes
      get sales_v1_ingredient_url(ingredient), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'com parâmetros válidos' do
      it 'cria um novo ingrediente' do
        expect do
          post sales_v1_ingredients_url,
               params: { ingredient: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Ingredient, :count).by(1)
      end

      it 'renderiza uma resposta JSON com o novo ingrediente' do
        post sales_v1_ingredients_url,
             params: { ingredient: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parâmetros inválidos' do
      it 'não cria um novo ingrediente' do
        expect do
          post sales_v1_ingredients_url,
               params: { ingredient: invalid_attributes }, as: :json
        end.to change(Ingredient, :count).by(0)
      end

      it 'renderiza uma resposta JSON com erros para o novo ingrediente' do
        post sales_v1_ingredients_url,
             params: { ingredient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'com parâmetros válidos' do
      let(:new_attributes) do
        { name: 'Olives', multiplier: 2.5 }
      end

      it 'atualiza o ingredient solicitado' do
        ingredient = Ingredient.create! valid_attributes
        patch sales_v1_ingredient_url(ingredient),
              params: { ingredient: new_attributes }, headers: valid_headers, as: :json
        ingredient.reload
        expect(ingredient.name).to eq(new_attributes[:name])
      end

      it 'renderiza uma resposta JSON com o ingrediente' do
        ingredient = Ingredient.create! valid_attributes
        patch sales_v1_ingredient_url(ingredient),
              params: { ingredient: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parâmetros inválidos' do
      it 'renderiza uma resposta JSON com erros para o ingrediente' do
        ingredient = Ingredient.create! valid_attributes
        patch sales_v1_ingredient_url(ingredient),
              params: { ingredient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destrói o ingrediente solicitado' do
      ingredient = Ingredient.create! valid_attributes
      expect do
        delete sales_v1_ingredient_url(ingredient), headers: valid_headers, as: :json
      end.to change(Ingredient, :count).by(-1)
    end
  end
end
