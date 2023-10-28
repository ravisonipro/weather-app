class WeatherController < ApplicationController
    def index
        @city = params[:city]
        @weather_data = WeatherService.new(ENV['OPENWEATHERMAP_API_KEY']).get_weather(@city)
    end
end