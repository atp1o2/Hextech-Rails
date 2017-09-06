require 'rails_helper'

RSpec.describe Champion, type: :model do
  it { should have_many(:games).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
