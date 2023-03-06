require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'validacoes dos atributos' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:multiplier) }
  end
end
