require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'validando os atributos' do
    it { should belong_to(:pizza) }
  end

  context 'validando os relacionamentos' do
    it { should have_many(:add).through(:order_item_add_ingredients) }
    it { should have_many(:order_item_add_ingredients) }
    it { should have_many(:remove).through(:order_item_remove_ingredients) }
    it { should have_many(:order_item_remove_ingredients) }
  end
end
