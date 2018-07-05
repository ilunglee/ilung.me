class AdminUser < ApplicationRecord

  mount_uploader :avatar, CbStem::MediaUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def display_name
    full_name
  end

  def avatar_extension_whitelist
    CbStem::MediaUploader::IMAGE_TYPES
  end

end
