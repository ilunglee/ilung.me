# Application Uploader For Asset Uploads
class ApplicationUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def image?
    content_type&.start_with? 'image'
  end

  def file?
    content_type&.start_with? 'application'
  end

  def video?
    content_type&.start_with? 'video'
  end

end
