require 'rails_helper'

RSpec.describe Pizza, type: :model do
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:name) }
end
