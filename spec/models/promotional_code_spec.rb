require 'rails_helper'

RSpec.describe PromotionalCode, type: :model do
  context 'validando os atributos' do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:code) }
  end

  context 'validandos os relacionamentos' do
    it { should have_many(:orders).through(:order_promotional_codes) }
    it { should have_many(:order_promotional_codes) }
  end
end
