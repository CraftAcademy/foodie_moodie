require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "geocoder"

Bundler.require(*Rails.groups)

module FoodieMoodie
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
    end
    config.generators.system_tests = nil
    config.stripe.secret_key = ENV["SECRET_KEY"]
    config.stripe.publishable_key = ENV["PUBLISHABLE_KEY"]
    config.stripe.endpoint = "/payment/stripe-integration"

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any,
                 methods: [:get],
                 max_age: 0
      end
    end
  end
end
