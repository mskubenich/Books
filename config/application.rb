require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module BooksApp
  class Application < Rails::Application
   I18n.enforce_available_locales = true
  end
end
