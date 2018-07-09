require 'rails_helper'

RSpec.describe 'Admin::AdminUser', type: :feature do
  feature 'As an admin_user I want to manage admin_users' do
    let(:admin_user)   { create(:admin_user) }
    let(:index_path)   { admin_admin_users_path }
    let(:new_path)     { new_admin_admin_user_path }
    let(:show_path)    { admin_admin_user_path(admin_user) }
    let(:edit_path)    { edit_admin_admin_user_path(admin_user) }
    let(:destroy_path) { edit_path }

    it_behaves_like 'features/admin index'
    it_behaves_like 'features/admin edit'
    it_behaves_like 'features/admin show'
    it_behaves_like 'features/admin destroy'
  end
end
