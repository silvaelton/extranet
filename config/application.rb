require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

require 'dotenv/load'

module Extranet
  class Application < Rails::Application
    config.load_defaults 5.2
    
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.assets.paths << Rails.root.join('vendor', 'templates')
    config.assets.paths << Rails.root.join('vendor', 'stylesheets')
    config.assets.paths << Rails.root.join('vendor', 'javascripts')
     
    config.autoload_paths << Rails.root.join('lib', 'generators')
  
    config.generators do |g|
      g.template_engine :haml
    end
  end
end
