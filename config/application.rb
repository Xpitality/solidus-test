require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SolidusTest
  class Application < Rails::Application
    # Prevent this deprecation message: https://github.com/svenfuchs/i18n/commit/3b6e56e
    I18n.enforce_available_locales = true
    # Load application's model / class decorators
    initializer 'spree.decorators' do |app|
      config.to_prepare do
        Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
          require_dependency(path)
        end
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 6.0
    config.autoload = :classic
    config.action_controller.default_protect_from_forgery = true

    config.i18n.available_locales = [:it, :en]
    config.i18n.default_locale = :it
    config.eager_load_paths << Rails.root.join('lib')

    # Disable concurrent assets compilation to avoid sassc segfault
    config.assets.configure do |env|
          env.export_concurrent = false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Rome'

    config.active_job.queue_adapter = :delayed_job

    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 %r{^/(.*)/$}, '/$1'
    end
  end
end
