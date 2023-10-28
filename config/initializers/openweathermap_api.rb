Faraday.new(url: 'https://api.openweathermap.org/data/2.5') do |faraday|
    faraday.params['appid'] = ENV['OPENWEATHERMAP_API_KEY']
    faraday.request :url_encoded
    faraday.adapter Faraday.default_adapter
end