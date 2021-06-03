# frozen_string_literal: true

SolidusPaypalCommercePlatform.configure do |config|
  # TODO: Remember to change this with the actual preferences you have implemented!
  # config.sample_preference = 'sample_value'

  config.env = Rails.env.production? ? 'live' : 'sandbox'
end
