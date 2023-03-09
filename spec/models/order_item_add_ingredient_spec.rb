require 'rails_helper'

RSpec.describe OrderItemAddIngredient, type: :model do
  context 'validandos os atributos' do
    it { should belong_to(:add) }
    it { should belong_to(:order_item) }
  end
end
