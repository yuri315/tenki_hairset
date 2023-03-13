class WeatherForecast < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :advice_material
end