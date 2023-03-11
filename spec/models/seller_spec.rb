require 'rails_helper'

RSpec.describe Seller, type: :model do
  context 'valicações dos atributos' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:profile) }
  end

  context 'validando os relacionamentos' do
    it { should have_many(:orders) }
  end
end
