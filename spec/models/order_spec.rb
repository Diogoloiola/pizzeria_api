require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validando os relacionamentos' do
    it { should have_many(:promotional_codes).through(:order_promotional_codes) }
    it { should have_many(:order_promotional_codes) }
  end

  context 'validando os relacionamentos' do
    it { should have_many(:items) }
    it { should belong_to(:seller).optional }
  end
end
