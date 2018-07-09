require 'rails_helper'

RSpec.describe 'Admin::Project', type: :feature do
  feature 'As an admin_user I want to manage projects' do
    let(:admin_user)   { create(:admin_user) }
    let(:project)      { create(:project) }
    let(:index_path)   { admin_projects_path }
    let(:new_path)     { new_admin_project_path }
    let(:edit_path)    { edit_admin_project_path(project) }
    let(:destroy_path) { edit_path }

    it_behaves_like 'features/admin index'
    it_behaves_like 'features/admin edit'
    it_behaves_like 'features/admin destroy'
  end
end
