require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
  describe 'CRUD' do
    let(:admin_user) { create(:admin_user) }
    let(:project)    { create(:project) }
    let(:id)         { project.id }

    it_behaves_like 'controllers/admin index'
    it_behaves_like 'controllers/admin new'
    it_behaves_like 'controllers/admin edit'
  end
end
