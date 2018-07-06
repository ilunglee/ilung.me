require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  let(:subject) { build_stubbed(:contact) }

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:message) }
  end
end
