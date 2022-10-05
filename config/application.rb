# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PetrovSmile
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.i18n.default_locale = :ru
    config.active_storage.variant_processor = :mini_magick

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_mailer.default_url_options = { :host => 'pervichka.pro' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => 'connect.smtp.bz',
        :port => 2525,
        :domain => 'pervichka.pro',
        :authentication => :login,
        :user_name => 'admin@pervichka.pro',
        :password => 'KO8d0vYWYWgX'
    }
    
  end
end
