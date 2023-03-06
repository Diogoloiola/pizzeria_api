require 'rails_helper'

RSpec.describe '/sales/v1/discounts', type: :request do
  let(:valid_attributes) do
   { deduction_in_percent: 3.0, code: SecureRandom.uuid }
  end

  let(:invalid_attributes) do
    { deduction_in_percent: 0 }
  end

  let(:valid_headers) do
    auth_header(create(:seller))
  end

  describe 'GET /index' do
    it 'apresenta uma resposta bem-sucedida' do
      Discount.create! valid_attributes
      get sales_v1_discounts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'apresenta uma resposta bem-sucedida' do
      discount = Discount.create! valid_attributes
      get sales_v1_discount_url(discount), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'Com parametros válidos' do
      it 'cria um novo desconto' do
        expect do
          post sales_v1_discounts_url,
               params: { discount: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Discount, :count).by(1)
      end

      it 'renderiza um json com o sucesso ao criar um desconto' do
        post sales_v1_discounts_url,
             params: { discount: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parametros inválidos' do
      it 'não cria um novo desconto' do
        expect do
          post sales_v1_discounts_url,
               params: { discount: invalid_attributes }, as: :json, headers: valid_headers
        end.to change(Discount, :count).by(0)
      end

      it 'renderiza um json com o erro' do
        post sales_v1_discounts_url,
             params: { discount: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'com parametros' do
      let(:new_attributes) do
        { deduction_in_percent: 9.0 }
      end

      it 'atualiza o desconto' do
        discount = Discount.create! valid_attributes
        patch sales_v1_discount_url(discount),
              params: { discount: new_attributes }, headers: valid_headers, as: :json
        discount.reload
        expect(discount.deduction_in_percent).to eql(new_attributes[:deduction_in_percent])
      end

      it 'renderiza uma resposta JSON com o discount' do
        discount = Discount.create! valid_attributes
        patch sales_v1_discount_url(discount),
              params: { discount: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parâmetros inválidos' do
      it 'renderiza uma resposta JSON com erros para o discount' do
        discount = Discount.create! valid_attributes
        patch sales_v1_discount_url(discount),
              params: { discount: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested discount' do
      discount = Discount.create! valid_attributes
      expect do
        delete sales_v1_discount_url(discount), headers: valid_headers, as: :json
      end.to change(Discount, :count).by(-1)
    end
  end
end
