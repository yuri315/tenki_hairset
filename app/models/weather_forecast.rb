class WeatherForecast < ApplicationRecord
  belongs_to :user
  belongs_to :advice_material
end