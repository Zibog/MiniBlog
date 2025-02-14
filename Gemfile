source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'active_storage_validations', '0.8.9'
gem 'faker',                   '>= 1.4.2'
gem 'carrierwave',             '>= 0.10.0'
gem 'mini_magick',             '>= 3.8.0'
gem 'will_paginate',           '>= 3.0.7'
gem 'bootstrap-will_paginate', '>= 0.0.10'
gem 'bootstrap-sass',          '>= 3.2.0.0'
gem 'uglifier',                '>= 2.5.3'
gem 'coffee-rails',            '>= 4.1.0'
gem 'jquery-rails',            '>= 4.0.3'
gem 'sdoc',                    '>= 0.4.0', group: :doc

# Use Active Storage variant
gem 'image_processing', '1.9.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'minitest-reporters', '>= 1.0.5'
  gem 'mini_backtrace',     '>= 0.1.3'
  gem 'guard-minitest',     '>= 2.3.1'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg',             '>= 0.17.1'
  gem 'rails_12factor', '>= 0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
