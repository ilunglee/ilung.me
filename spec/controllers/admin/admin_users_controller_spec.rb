require 'rails_helper'

RSpec.describe Admin::AdminUsersController, type: :controller do
  describe 'CRUD' do
    let(:admin_user) { create(:admin_user) }
    let(:id)         { admin_user.id }

    it_behaves_like 'controllers/admin index'
    it_behaves_like 'controllers/admin new'
    it_behaves_like 'controllers/admin edit'
  end
end
