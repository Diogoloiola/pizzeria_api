# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/sales/v1/promotional_codes', type: :request do # rubocop:disable Metrics/BlockLength: Block has too many lines.
  let(:pizza) { FactoryBot.create(:pizza) }

  let(:valid_attributes) do
    { code: SecureRandom.uuid.slice(0, 5), from: 2, to: 1, target_id: pizza.id, size: :small }
  end

  let(:invalid_attributes) do
    { code: SecureRandom.uuid.slice(0, 5), from: 2, to: 1, target_id: pizza.id, size: nil }
  end

  let(:valid_headers) do
    auth_header(create(:seller))
  end

  describe 'GET /index' do
    it 'apresenta uma resposta bem-sucedida' do
      PromotionalCode.create! valid_attributes
      get sales_v1_promotional_codes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'apresenta uma resposta bem-sucedida' do
      promotional_code = PromotionalCode.create! valid_attributes
      get sales_v1_promotional_code_url(promotional_code), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do # rubocop:disable Metrics/BlockLength: Block has too many lines.
    context 'com parâmetros válidos' do
      it 'cria um novo código promocional' do
        expect do
          post sales_v1_promotional_codes_url,
               params: { promotional_code: valid_attributes }, headers: valid_headers, as: :json
        end.to change(PromotionalCode, :count).by(1)
      end

      it 'renderiza uma resposta JSON com o novo código promocional' do
        post sales_v1_promotional_codes_url,
             params: { promotional_code: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parâmetros inválidos' do
      it 'não cria um novo Código Promocional' do
        expect do
          post sales_v1_promotional_codes_url,
               params: { promotional_code: invalid_attributes }, as: :json
        end.to change(PromotionalCode, :count).by(0)
      end

      it 'renderiza uma resposta JSON com erros para o novo código promocional' do
        post sales_v1_promotional_codes_url,
             params: { promotional_code: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do # rubocop:disable Metrics/BlockLength: Block has too many lines.
    context 'com parâmetros válidos' do
      let(:new_attributes) do
        { from: 3 }
      end

      it 'atualiza o código promocional solicitado' do
        promotional_code = PromotionalCode.create! valid_attributes
        patch sales_v1_promotional_code_url(promotional_code),
              params: { promotional_code: new_attributes }, headers: valid_headers, as: :json
        promotional_code.reload
        expect(promotional_code.from).to eql(new_attributes[:from])
      end

      it 'renderiza uma resposta JSON com o código_promocional' do
        promotional_code = PromotionalCode.create! valid_attributes
        patch sales_v1_promotional_code_url(promotional_code),
              params: { promotional_code: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parâmetros inválidos' do
      it 'renderiza uma resposta JSON com erros para o código promocional' do
        promotional_code = PromotionalCode.create! valid_attributes
        patch sales_v1_promotional_code_url(promotional_code),
              params: { promotional_code: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destrói o código promocional solicitado' do
      promotional_code = PromotionalCode.create! valid_attributes
      expect do
        delete sales_v1_promotional_code_url(promotional_code), headers: valid_headers, as: :json
      end.to change(PromotionalCode, :count).by(-1)
    end
  end
end
