require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'validando os atributos' do
    it { should belong_to(:pizza) }
  end
end
