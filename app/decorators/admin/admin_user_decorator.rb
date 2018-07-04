# Decorates AdminUser for AA
class Admin::AdminUserDecorator < ApplicationDecorator

  decorates :admin_user

  def identifier
    table_item_identifier(
      full_name, [:admin, object],
      object,
      image: 'avatar',
      options: { class: 'mr-2', icon: 'single-02' }
    )
  end

  def avatar(*args)
    options = args.extract_options!
    options.reverse_merge!(icon: 'single-02')
    thumbnail(object, 'avatar', options)
  end

end
