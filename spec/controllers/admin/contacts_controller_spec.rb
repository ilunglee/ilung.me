require 'rails_helper'

RSpec.describe Admin::ContactsController, type: :controller do
  describe 'CRUD' do
    let(:admin_user) { create(:admin_user) }
    let(:contact)    { create(:contact) }
    let(:id)         { contact.id }

    it_behaves_like 'controllers/admin index'
    it_behaves_like 'controllers/admin new'
    it_behaves_like 'controllers/admin edit'
  end
end
