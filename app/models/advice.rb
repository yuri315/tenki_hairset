class Advice < ApplicationRecord
  belongs_to :weather_forecast, optional: true
end
