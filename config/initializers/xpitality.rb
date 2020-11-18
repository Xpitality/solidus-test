# require 'slack-notify'
require 'bugsnag'

# Xpitality::Notifier::ChatNotifier.configure do |config|
#   config.set_option :client, :slack
#   config.set_option :webhook_url, 'https://hooks.slack.com/services/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'
#   config.set_option :channel, '#ecommerce-en'
#   config.set_option :username, 'ecommerce-en'
#   config.set_option :icon_url, 'https://xpitalitycms.com/images/icons/xpitality.png'
# end

Xpitality::Notifier::ExceptionNotifier.configure do |config|
  config.set_option :client, :bugsnag
end