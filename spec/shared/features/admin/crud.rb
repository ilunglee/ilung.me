shared_examples 'features/admin index' do
  scenario 'list records' do
    login_as(admin_user, scope: :admin_user)
    visit index_path

    expect(page).to have_http_status(:success)
  end
end

shared_examples 'features/admin new' do
  scenario 'create new record' do
    login_as(admin_user, scope: :admin_user)
    visit new_path
    first('input[type="submit"]').click

    expect(page).to have_http_status(:success)
  end
end

shared_examples 'features/admin show' do
  scenario 'view record' do
    login_as(admin_user, scope: :admin_user)
    visit show_path

    expect(page).to have_http_status(:success)
  end
end

shared_examples 'features/admin edit' do
  scenario 'update record' do
    login_as(admin_user, scope: :admin_user)
    visit edit_path
    first('input[type="submit"]').click

    expect(page).to have_http_status(:success)
  end
end

shared_examples 'features/admin destroy' do
  scenario 'delete record' do
    login_as(admin_user, scope: :admin_user)
    visit destroy_path
    first('a[data-method="delete"]').click

    expect(page).to have_http_status(:success)
  end
end
