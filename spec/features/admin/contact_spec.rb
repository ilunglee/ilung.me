require 'rails_helper'

RSpec.describe 'Admin::Contact', type: :feature do
  feature 'As an admin_user I want to manage contacts' do
    let(:admin_user)   { create(:admin_user) }
    let(:contact)      { create(:contact) }
    let(:index_path)   { admin_contacts_path }
    let(:new_path)     { new_admin_contact_path }
    let(:edit_path)    { edit_admin_contact_path(contact) }
    let(:destroy_path) { edit_path }

    it_behaves_like 'features/admin index'
    it_behaves_like 'features/admin edit'
    it_behaves_like 'features/admin destroy'
  end
end
