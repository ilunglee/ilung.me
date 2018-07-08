# Decorates Project for AA
class Admin::ProjectDecorator < ProjectDecorator

  decorates :project

  def identifier
    table_item_identifier(
      title, [:edit, :admin, object],
      object,
      image: 'browser',
      options: { class: 'mr-2', size: 'md' }
    )
  end

  def devices
    tags =
      object.devices.collect do |x|
        content_tag(:span, x, class: 'badge badge-secondary m-1')
      end
    safe_join(tags)
  end

end
