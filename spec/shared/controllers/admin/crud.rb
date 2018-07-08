shared_examples 'controllers/admin index' do
  it 'should be 200' do
    sign_in(admin_user, scope: :admin_user)
    get :index
    expect(response).to have_http_status(:success)
  end
end

shared_examples 'controllers/admin new' do
  it 'should be 200' do
    sign_in(admin_user, scope: :admin_user)
    get :new
    expect(response).to have_http_status(:success)
  end
end

shared_examples 'controllers/admin show' do
  it 'should be 200' do
    sign_in(admin_user, scope: :admin_user)
    get :show, params: { id: id }
    expect(response).to have_http_status(:success)
  end
end

shared_examples 'controllers/admin edit' do
  it 'should be 200' do
    sign_in(admin_user, scope: :admin_user)
    get :edit, params: { id: id }
    expect(response).to have_http_status(:success)
  end
end

shared_examples 'controllers/admin destroy' do
  describe 'POST destroy' do
    it 'should be 200' do
      sign_in(admin_user, scope: :admin_user)
      delete :destroy, params: { id: id }
      expect(response).to have_http_status(:success).or have_http_status(:redirect)
    end
  end
end

shared_examples 'controllers/admin update' do
  describe 'POST update' do
    it 'should be 200' do
      sign_in(admin_user, scope: :admin_user)
      post :update, params: params
      expect(response).to have_http_status(:success).or have_http_status(:redirect)
    end
  end
end
