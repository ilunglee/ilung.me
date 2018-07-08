class Project < ApplicationRecord

  DEVICES = %w[iphone browser epos square].freeze

  mount_uploader :browser, CbStem::MediaUploader
  mount_uploader :mobile,  CbStem::MediaUploader

  acts_as_list add_new_at: :top

  validates :title, :description,
            presence: true
  validates :video, url_format: true, allow_blank: true
  validate :valid_devices

  def browser_extension_whitelist
    CbStem::MediaUploader::IMAGE_TYPES
  end

  def mobile_extension_whitelist
    CbStem::MediaUploader::IMAGE_TYPES
  end

  def video_object
    return if video.blank?
    VideoInfo.new(video)
  rescue VideoInfo::UrlError
    nil
  end

  def self.permitted_params
    %i[
      title description mobile browser devices video
      position background_color
    ]
  end

  private

  def valid_devices
    invalids = (devices - DEVICES)
    return if invalids.blank?
    invalids.each do |invalid|
      errors.add(:devices, "#{invalid} #{I18n.t(:inclusion, scope: %i[errors messages])}")
    end
  end

end
