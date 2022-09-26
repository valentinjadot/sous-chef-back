require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module SousChefBack
  class Application < Rails::Application
    config.i18n.fallbacks = [:es, :en]
    config.i18n.default_locale = 'es-CL'
    config.assets.paths << Rails.root.join('node_modules')
    config.load_defaults 6.1
  end
end
