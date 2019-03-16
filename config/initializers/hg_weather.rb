HG::Weather.setup do |config|
  # You can generate your key on hgbrasil.com/weather
  # Key is required for search by name, geolocation or IP.
  config.api_key = ENV['WEATHER_KEY']

  # Set locale for response, default is english, available: pt-br, en
  config.locale = 'pt-br'

  # Use SSL on request, default and recommended is true
  config.use_ssl = true

  # Coming... If you are using Rails, request can be cached on cache engine
  config.use_rails_cache = true

  # You can set default search, by these methods below:

  # config.woeid = '2487956' # set default with an WOEID (Where on Earth ID)
  # config.city_name = 'Brasília, DF' # set city name for search
  # config.latitude = -41.0 # set latitude
  # config.longitude = -41.0 # set longitude
  # config.client_ip = :remote # your IP or 'remote' to get automatically
  # config.cid = 'BRXX0198' # search by CID, deprecated and only for Brazil
end