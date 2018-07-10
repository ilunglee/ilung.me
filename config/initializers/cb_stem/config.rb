CbStem.setup do |config|
  config.google_analytics = {
    private_key:   ENV['GOOGLE_API_PRIVATE_KEY'],
    email:         ENV['GOOGLE_API_EMAIL'],
    tracking_code: ENV['GOOGLE_TRACKING_CODE'],
    priority:      10
  }
end
