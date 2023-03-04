require 'rails_helper'
require 'byebug'
RSpec.describe '/sales/v1/sellers', type: :request do
  let(:valid_attributes) do
    { name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Number.number(digits: 10).to_s,
      profile: %w[admin functionarty].sample }
  end

  let(:invalid_attributes) do
    { name: Faker::Name.name, email: Faker::Internet.email, profile: nil }
  end

  let(:valid_headers) do
    auth_header(create(:seller))
  end

  describe 'GET' do
    context '/index' do
      it 'retorna todos os vendedores cadastrados' do
        Seller.create! valid_attributes
        get sales_v1_sellers_url, headers: valid_headers, as: :json
        expect(response).to be_successful
      end
    end

    context '/index/:id' do
      it 'retorna o vendedor baseado no id' do
        seller = Seller.create! valid_attributes
        get sales_v1_seller_url(seller), as: :json, headers: valid_headers
        expect(response).to be_successful
      end

      it 'retorna erro caso o vendedor não exista' do
        expect do
          get sales_v1_seller_url(100), as: :json, headers: valid_headers
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PATH' do
    context 'com parametros válidos' do
      it 'valida se o email do usuário foi atualizado' do
        seller = Seller.create! valid_attributes

        patch sales_v1_seller_url(seller),
              params: { seller: { email: Faker::Internet.email } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'com parametros inválidos' do
      let(:seller) { create(:seller) }

      it 'valida ocorre erro quando o email é duplicado' do
        new_seller = Seller.create! valid_attributes

        patch sales_v1_seller_url(new_seller),
              params: { seller: { email: seller.email } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE' do
    it 'Destroi um vendedor' do
      seller = Seller.create! valid_attributes
      delete sales_v1_seller_url(seller), headers: valid_headers, as: :json
      expect(response).to have_http_status(:no_content)
      expect { seller.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
