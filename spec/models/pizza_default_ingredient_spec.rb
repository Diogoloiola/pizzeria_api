require 'rails_helper'

RSpec.describe PizzaDefaultIngredient, type: :model do
  context 'validando os atributos' do
    it { should belong_to(:pizza) }
    it { should belong_to(:ingredient) }
  end
end
