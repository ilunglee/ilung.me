class Project < ApplicationRecord

  mount_uploader :background, CbStem::MediaUploader

  validates :name, :video_url, :background,
            presence: true

  def background_extension_whitelist
    CbStem::MediaUploader::IMAGE_TYPES
  end

end
