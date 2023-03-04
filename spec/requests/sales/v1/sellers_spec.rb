require 'rails_helper'
require 'byebug'
RSpec.describe '/sales/v1/sellers', type: :request do
  let!(:valid_attributes) do
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

  describe 'GET /index' do
    it 'renders a successful response' do
      Seller.create! valid_attributes
      get sales_v1_sellers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      seller = Seller.create! valid_attributes
      get sales_v1_seller_url(seller), as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end
end
