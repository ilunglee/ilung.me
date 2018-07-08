# Decorates Contact for AA
class Admin::ContactDecorator < ContactDecorator

  decorates :contact

  def identifier
    link_to name, [:edit, :admin, object]
  end

end
