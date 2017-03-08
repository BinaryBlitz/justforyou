source 'https://rubygems.org'

ruby '~> 2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.19'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6'

# Front-end
gem 'bootstrap-sass', '~> 3.3'
gem 'slim-rails', '~> 3.1'
gem 'nested_form_fields', '~> 0.8'
gem 'bootstrap-datepicker-rails', '~> 1.6'

# Auth
gem 'devise', '~> 4.2'
gem 'pundit', '~> 1.1'

# I18n
gem 'rails-i18n', '~> 5.0'
gem 'devise-i18n', '~> 1.1'

# Image processing
gem 'carrierwave', '~> 0.11'
gem 'mini_magick', '~> 4.6'

# Utilities
gem 'phonelib', '~> 0.6'
gem 'email_validator', '~> 1.6'
gem 'kaminari', '~> 0.17'
gem 'geokit', '~> 1.10'
gem 'httparty', '~> 0.14'
gem 'configurable_engine', '~> 0.4'

# Push notifications
gem 'houston', '~> 2.2'
# Payments
gem 'payonline', git: 'https://github.com/dankimio/payonline.git'
# Analytics
gem 'rollbar', '~> 2.14'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'pry-rails'
end

group :production do
  gem 'fog-aws', '~> 0.12'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
