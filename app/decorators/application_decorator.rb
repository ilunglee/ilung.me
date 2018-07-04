# Application Base Decorator
class ApplicationDecorator < Draper::Decorator

  include Draper::LazyHelpers
  delegate_all

  private

  def to_currency(attr)
    number_to_currency(attr, precision: 2)
  end

  def to_percentage(attr)
    number_to_percentage(attr, precision: 2)
  end

end
