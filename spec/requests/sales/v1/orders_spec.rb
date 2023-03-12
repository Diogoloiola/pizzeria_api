require 'rails_helper'

RSpec.describe '/sales/v1/orders', type: :request do # rubocop:disable Metrics/BlockLength: Block has too many lines
  let(:pizza) { create(:pizza) }
  let(:seller) { create(:seller) }
  let(:discount) { create(:discount) }

  let(:valid_attributes) do
    {
      discount_code: discount.id,
      seller_id: seller.id,
      itens_attributes: [{
        pizza_id: pizza.id,
        size: :small
      }]
    }
  end

  let(:invalid_attributes) do
    {
      discount_code: discount.id,
      seller_id: seller.id,
      itens_attributes: [{
        pizza_id: pizza.id,
        size: nil
      }]
    }
  end

  let(:valid_headers) do
    auth_header(seller)
  end

  describe 'GET /index' do
    it 'renderiza uma mensagem de sucesso' do
      Order.create! valid_attributes
      get sales_v1_orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renderiza uma mensagem de sucesso' do
      order = Order.create! valid_attributes
      get sales_v1_order_url(order), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do # rubocop:disable Metrics/BlockLength: Block has too many lines
    context 'criando com parametros válidos' do
      it 'cria um novo pedido' do
        expect do
          post sales_v1_orders_url,
               params: { order: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Order, :count).by(1)
      end

      it 'renderiza um json com a resposta da requisição' do
        post sales_v1_orders_url,
             params: { order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parametros inválidos' do
      it 'não cria um pedido' do
        expect do
          post sales_v1_orders_url,
               params: { order: invalid_attributes }, as: :json
        end.to change(Order, :count).by(0)
      end

      it 'renderiza um json com o erro' do
        post sales_v1_orders_url,
             params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do # rubocop:disable Metrics/BlockLength: Block has too many lines
    context 'com parametros válidos' do
      let(:new_attributes) do
        {
          discount_code: discount.id,
          seller_id: seller.id,
          itens_attributes: [{
            pizza_id: pizza.id,
            size: :small
          }, {
            pizza_id: pizza.id,
            size: :extra_large
          }]
        }
      end

      it 'renderiza um json com a resposta corretas' do
        order = Order.create! valid_attributes
        patch sales_v1_order_url(order),
              params: { order: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parametros inválidos' do # : Block has too many lines
      it 'renderiza um erro' do
        order = Order.create! valid_attributes
        patch sales_v1_order_url(order),
              params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroy o pedido selecionado' do # : Block has too many lines
      order = Order.create! valid_attributes
      expect do
        delete sales_v1_order_url(order), headers: valid_headers, as: :json
      end.to change(Order, :count).by(-1)
    end
  end
end
