class Contact < ApplicationRecord

  validates :name, :message, presence: true
  validates :email, presence: true, email_format: true

  def self.permitted_params
    %i[name email message]
  end

end
