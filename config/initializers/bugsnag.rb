Bugsnag.configure do |config|
  config.api_key = "e3c257066765bc747c232e7c3391299d"
  config.notify_release_stages = %w(staging production)
  config.timeout = 20
  config.app_version = '1.0.0'
end
