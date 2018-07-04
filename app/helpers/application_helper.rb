module ApplicationHelper

  def rails_route
    "#{controller_name} #{action_name}"
  end

  def email_link(email, *args)
    return if email.blank?
    link_to email, "mailto:#{email}", *args
  end

end
