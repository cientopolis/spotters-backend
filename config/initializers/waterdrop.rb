WaterDrop.setup do |config|
  config.send_messages = Rails.env.production?
  config.connection_pool_size = 20
  config.connection_pool_timeout = 1
  config.raise_on_failure = false
  config.kafka.hosts = [Rails.env.production? ? 'prod-host:9091' : 'localhost:9092']
  config.raise_on_failure = Rails.env.production?
end
