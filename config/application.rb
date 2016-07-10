require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Justforyou
  class Application < Rails::Application
    config.active_record.time_zone_aware_types = [:datetime]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Moscow'

    config.generators do |g|
      g.helper = false
      g.assets = false
    end
  end
end
