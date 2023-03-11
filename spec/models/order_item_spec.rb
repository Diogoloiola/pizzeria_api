require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'validando os atributos' do
    it { should validate_presence_of(:size) }
  end

  context 'validando os relacionamentos' do
    it { should belong_to(:pizza) }
    it { should have_many(:add).through(:order_item_add_ingredients) }
    it { should have_many(:order_item_add_ingredients) }
    it { should have_many(:remove).through(:order_item_remove_ingredients) }
    it { should have_many(:order_item_remove_ingredients) }
  end
end
