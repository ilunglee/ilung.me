AdminUser.destroy_all

AdminUser.create!(
  first_name: 'ilung',
  last_name: 'lee',
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS']
)
