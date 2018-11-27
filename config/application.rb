require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    Refile.secret_key = '0a1a111af5f9d96b25c0ae354a13908ed1d04dddbdab39f96abc33b5dfb28d01c727f89ca81ac408f96526f0a8358dc60c9a340e27978e12d82495fa0582cce0'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
