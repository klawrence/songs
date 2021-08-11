require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Songs
  class Application < Rails::Application
    config.load_defaults 6.1
    config.google_analytics_id = 'UA-99999'
  end
end
