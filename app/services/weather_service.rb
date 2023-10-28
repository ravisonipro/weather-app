# app/services/weather_service.rb

require 'net/http'
require 'json'

class WeatherService
  API_BASE_URL = 'https://api.openweathermap.org/data/2.5/find?'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_weather(city)

    uri = URI(API_BASE_URL)
    uri.query = URI.encode_www_form(q: city, appid: @api_key)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      nil
    end
  end
end
