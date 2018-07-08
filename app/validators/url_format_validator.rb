# Url Format Regex Validator
class UrlFormatValidator < ActiveModel::EachValidator

  URL_REGEX =
    %r{^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$}i

  def validate_each(object, attribute, value)
    unless value&.match? URL_REGEX
      object.errors[attribute] << (
        options[:message] || I18n.t('activerecord.errors.messages.format')
      )
    end
    object.errors
  end

end
