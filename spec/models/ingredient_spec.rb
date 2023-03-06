require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'validacoes dos atributos' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:multiplier) }
  end

  context 'validando as associaçoes' do
    it { should have_many(:pizzas).through(:pizza_default_ingredients) }
    it { should have_many(:pizza_default_ingredients) }
  end
end
