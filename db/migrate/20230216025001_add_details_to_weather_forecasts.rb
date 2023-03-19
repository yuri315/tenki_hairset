class AddDetailsToWeatherForecasts < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_forecasts, :temp_max, :float
    add_column :weather_forecasts, :temp_min, :float
    add_column :weather_forecasts, :weather_id, :int
    add_column :weather_forecasts, :humidity, :float
    add_column :weather_forecasts, :wind_speed, :float
    add_column :weather_forecasts, :weather_icon, :string
  end
end
