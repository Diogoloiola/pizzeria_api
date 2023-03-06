require 'rails_helper'

RSpec.describe Pizza, type: :model do
  context 'Validando os atributos' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:name) }
  end

  context 'Validando as associaçoes' do
    it { should have_many(:ingredients).through(:pizza_default_ingredients) }
    it { should have_many(:ingredients) }
  end
end
