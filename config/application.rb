require_relative 'boot'

require 'rails/all'

# require 'action_text'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wabay
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # helper ActionText::Engine.helpers

    config.load_defaults 6.1

    config.autoloader = :classic


    config.i18n.default_locale = 'zh-TW'
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Taipei"
    config.active_record.default_timezone = :local 
    config.eager_load_paths << Rails.root.join("extras")

    # 讓 Rails 可以找到 sidekiq 的 job 檔案
    config.eager_load_paths += %W( #{config.root}/app/jobs )
  end
end