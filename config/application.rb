require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CommunityChat
  class Application < Rails::Application
    config.generators do |g|
      config.time_zone = 'Tokyo'
      config.active_record.default_timezone = :local
      config.i18n.default_locale = :ja

      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
end