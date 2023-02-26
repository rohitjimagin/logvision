require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # other lines...
    config.load_defaults 7.0
    config.log_level = :info
    config.lograge.enabled = true
    config.logger = ActFluentLoggerRails::Logger.new(settings: {
        host: ENV.fetch('FLUENTD_HOST', 'fluentd'), 
        port: 24224,
        tag: "rails.#{Rails.env}.#{Rails.application.class}",
        messages_type: 'string',
        severity_key: 'level'
    })

    config.lograge.formatter = Lograge::Formatters::Json.new
    config.lograge.custom_options = lambda do |event|
      {
        ip: Socket.ip_address_list.detect(&:ipv4_private?).ip_address,
        payload: event.payload
      }
    end
  end
end
