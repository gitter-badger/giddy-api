require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:nickname) }
  end

  describe 'relationships' do
    it { should have_many(:activities) }
  end
end
