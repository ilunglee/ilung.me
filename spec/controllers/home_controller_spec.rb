require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns projects and sorted by positoin' do
      create_list(:project, 3)
      get :index
      expect(assigns(:projects).pluck(:position)).to eq (1..3).to_a
    end
  end
end
