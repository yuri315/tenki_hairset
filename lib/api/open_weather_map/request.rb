module Api
  module OpenWeatherMap
    class Request
      attr_accessor :data

      def initialize(lat, lon)
        @data = {
          lat: lat,
          lon: lon,
          units: 'metric',
          appid: ENV.fetch('WEATHER_API_KEY', nil)
        }
      end

      def request
        client = HTTPClient.new
        request = client.get(ENV.fetch('WEATHER_URL', nil), data)
        JSON.parse(request.body)
      end

      def self.attributes_for(attrs)
        {
          temp_max: attrs['temp']['max'],
          temp_min: attrs['temp']['min'],
          humidity: attrs['humidity'],
          # temp_feel: attrs['main']['feels_like'],
          weather_id: attrs['weather'][0]['id'],
          weather_icon: attrs['weather'][0]['icon'],
          wind_speed: attrs['wind_speed']
        }
      end
    end
  end
end
