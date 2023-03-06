require 'rails_helper'

RSpec.describe PromotionalCode, type: :model do
  context 'validando os atributos' do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:code) }
  end
end
