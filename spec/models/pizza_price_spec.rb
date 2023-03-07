require 'rails_helper'

RSpec.describe PizzaPrice, type: :model do
  context 'validando atributos' do
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:value) }
  end

  context 'validando as associações' do
    it { should belong_to(:pizza) }
  end
end
