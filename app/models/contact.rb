class Contact < ApplicationRecord

  enum status: { pending: 0, in_progress: 1, won: 2, lost: 3 }

  validates :name, :message, presence: true
  validates :email, presence: true, email_format: true

  def self.permitted_params
    %i[name email message]
  end

end
