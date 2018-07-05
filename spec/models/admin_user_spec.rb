require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'has a valid factory' do
    expect(build(:admin_user)).to be_valid
  end

  let(:subject) { build_stubbed(:admin_user) }

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'Attributes' do
    it 'returns full_name' do
      subject = create(:admin_user, first_name: 'john', last_name: 'doe')
      expect(subject.full_name).to eq('john doe')
    end

    it 'returns full_name as display_name' do
      expect(subject.display_name).to eq(subject.full_name)
    end

    it 'only allows image types for avatar' do
      expect(subject.avatar_extension_whitelist).
        to eq(CbStem::MediaUploader::IMAGE_TYPES)
    end
  end
end
