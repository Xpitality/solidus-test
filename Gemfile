source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'mysql2'
gem 'activerecord-nulldb-adapter'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'solidus'

# needed for frontend:
# gem 'canonical-rails', '~> 0.2.10'
# gem 'font-awesome-rails', '~> 4.0'
# gem 'jquery-rails'
# gem 'kaminari', '~> 1.1'
# gem 'responders'
# gem 'truncate_html', '~> 0.9', '>= 0.9.2'

gem 'solidus_auth_devise'
gem 'solidus_paypal_commerce_platform'

# https://github.com/solidusio-contrib/solidus_related_products
gem 'solidus_related_products'

# https://github.com/solidusio-contrib/solidus_product_feed
gem 'solidus_product_feed'

# https://github.com/solidusio-contrib/solidus_sitemap
gem 'solidus_sitemap', github: 'solidusio-contrib/solidus_sitemap'

# https://github.com/solidusio-contrib/solidus_social
gem 'solidus_social'

# https://github.com/solidusio-contrib/solidus_editor
# https://github.com/galetahub/ckeditor
gem 'solidus_editor', github: 'solidusio-contrib/solidus_editor', branch: 'master'

# https://github.com/solidusio/solidus_stripe
gem 'solidus_stripe', '~> 3.0'

# https://github.com/boomerdigital/solidus_user_roles
gem 'solidus_user_roles', github: 'boomerdigital/solidus_user_roles'

gem 'solidus_i18n', '~> 2.0'
gem 'rails-i18n', '~> 6.0'
gem 'kaminari-i18n', '~> 0.5.0'

# https://github.com/karmakatahdin/solidus_seo
gem 'solidus_seo'

# https://github.com/nebulab/solidus_zip_zones
gem 'solidus_zip_zones', github: 'nebulab/solidus_zip_zones', branch: 'master'

# https://github.com/solidusio-contrib/solidus_abandoned_carts
gem 'solidus_abandoned_carts', github: 'solidusio-contrib/solidus_abandoned_carts'

gem 'alchemy-solidus', '~> 2.4.0'

gem 'solidus_import_products', :git => 'git://github.com/2BeDigital/solidus_import_products.git'

gem 'solidus_additional_store_settings', github: 'Xpitality/solidus_additional_store_settings'
gem 'solidus_taxon_images', github: 'Xpitality/solidus_taxon_images'

gem 'bugsnag'

gem "aws-sdk-s3", require: false

gem 'mail-x_smtpapi'
gem 'premailer-rails'

group :staging, :production do
  gem 'fog-aws'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

