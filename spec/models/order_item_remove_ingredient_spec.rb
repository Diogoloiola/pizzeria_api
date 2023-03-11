require 'rails_helper'

RSpec.describe OrderItemRemoveIngredient, type: :model do
  context 'validandos os atributos' do
    it { should belong_to(:remove) }
    it { should belong_to(:order_item) }
  end
end
