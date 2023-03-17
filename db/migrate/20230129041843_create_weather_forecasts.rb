class CreateWeatherForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_forecasts do |t|
      t.references :advice_material, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
