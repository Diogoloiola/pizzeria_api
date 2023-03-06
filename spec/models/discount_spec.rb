require 'rails_helper'

RSpec.describe Discount, type: :model do
  context 'validando os atributos' do
    it { should validate_presence_of(:deduction_in_percent) }
    it { should validate_presence_of(:code) }
  end
end
