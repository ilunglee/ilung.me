class Contact < ApplicationRecord

  validates :name, :email, :message, presence: true

  def self.permitted_params
    %i[name email message]
  end

end
