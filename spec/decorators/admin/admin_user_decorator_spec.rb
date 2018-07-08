require 'rails_helper'

RSpec.describe Admin::AdminUserDecorator, :url_helper do
  Admin::AdminUserDecorator.send :include, ActiveAdmin::ViewHelpers

  describe 'decorates' do
    let(:subject)   { FactoryBot.build_stubbed(:admin_user) }
    let(:d_subject) { Admin::AdminUserDecorator.decorate(subject) }

    it 'returns identifier' do
      match = d_subject.identifier.include?(url_for([:admin, subject, only_path: true]))
      expect(match).to eq(true)
    end

    it 'returns avatar' do
      match = subject.avatar.blank? || d_subject.avatar&.include?(subject.avatar_url)
      expect(match).to eq(true)
    end
  end
end
