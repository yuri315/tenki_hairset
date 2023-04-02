class WeatherForecastsController < ApplicationController
  before_action :set_advice_material, only: %i[create show]
  def new
    @weather_forecast = WeatherForecast.new
  end
  def create
    open_weather = Api::OpenWeatherMap::Request.new(City.joins(advice_materials: :user).where(user: {id: current_user}).pluck(:lat).join.to_f, City.joins(advice_materials: :user).where(user: {id: current_user}).pluck(:lon).join.to_f)
    response = open_weather.request
    if response!= "error" && @advice_material.forecast_date == "今日"
      params_weather_today = api_weather.attributes_for(response['daily'][0])
      find_weather.update!(params_weather_today)
      redirect_to weather_forecast_path(id: current_user.id)
    elsif response!= "error" && @advice_material.forecast_date == "明日"
      params_weather_tomorrow = api_weather.attributes_for(response['daily'][1])
      find_weather.update!(params_weather_tomorrow)
      redirect_to weather_forecast_path(id: current_user.id)
    else
      flash[:notice] = t '.fail'
    end 

  end
  def show
    user_weather = WeatherForecast.where(user_id: current_user.id)
    @weather_icon = user_weather.pluck(:weather_icon).join
    @humidity = user_weather.pluck(:humidity).join.to_f
    @wind_speed = user_weather.pluck(:wind_speed).join.to_f
    @temp_max = user_weather.pluck(:temp_max).join.to_i
    @temp_min = user_weather.pluck(:temp_min).join.to_i
    @hair_type = HairsFeature.where(user_id: current_user.id).pluck(:hair_type).join
  end
end

private
def find_weather
  WeatherForecast.find_or_initialize_by(advice_material_id: @advice_material.id, user_id: current_user.id)
end

def set_advice_material
  @advice_material = current_user.advice_material
end

def api_weather
  Api::OpenWeatherMap::Request
end
