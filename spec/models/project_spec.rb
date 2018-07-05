require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  let(:subject) { build_stubbed(:project) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it 'validates devices inclusion' do
      subject.devices = [Faker::Music.instrument]
      subject.valid?
      expect(subject.errors.keys.include?(:devices)).to eq(true)
    end
  end

  describe 'Attributes' do
    it 'only allows image types for browser' do
      expect(subject.browser_extension_whitelist).
        to eq(CbStem::MediaUploader::IMAGE_TYPES)
    end

    it 'only allows image types for mobile' do
      expect(subject.mobile_extension_whitelist).
        to eq(CbStem::MediaUploader::IMAGE_TYPES)
    end

    it 'only allows gif types for video' do
      expect(subject.video_extension_whitelist).
        to eq(%i[gif])
    end
  end
end
