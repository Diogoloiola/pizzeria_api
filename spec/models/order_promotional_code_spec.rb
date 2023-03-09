require 'rails_helper'

RSpec.describe OrderPromotionalCode, type: :model do
  context 'validandos os atributos' do
    it { should belong_to(:order) }
    it { should belong_to(:promotional_code) }
  end
end
