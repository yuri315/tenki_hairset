class WeatherForecastsController < ApplicationController
  def new
    @weather_forecast = WeatherForecast.new
  end
  def create
    open_weather = Api::OpenWeatherMap::Request.new(City.joins(advice_materials: :user).where(user: {id: current_user}).pluck(:lat).join.to_f, City.joins(advice_materials: :user).where(user: {id: current_user}).pluck(:lon).join.to_f)
    response = open_weather.request
    @advice_material = current_user.advice_material
    if response!= "error" && @advice_material.forecast_date == "今日"
      params_weather = Api::OpenWeatherMap::Request.attributes_for(response['daily'][0])
      WeatherForecast.find_or_initialize_by(advice_material_id: @advice_material.id, user_id: current_user.id).update!(params_weather)
      redirect_to weather_forecast_path(id: current_user.id)
    elsif response!= "error" && @advice_material.forecast_date == "明日"
      params_weather = Api::OpenWeatherMap::Request.attributes_for(response['daily'][1])
      WeatherForecast.find_or_initialize_by(advice_material_id: @advice_material.id, user_id: current_user.id).update!(params_weather)
      redirect_to weather_forecast_path(id: current_user.id)
    else
      flash[:notice] = "天気情報の取得に失敗しました"
    end 

  end
  def show
    @advice_material = current_user.advice_material
    @weather_icon = WeatherForecast.where(user_id: current_user.id).pluck(:weather_icon).join
    @humidity = WeatherForecast.where(user_id: current_user.id).pluck(:humidity).join.to_f
    @wind_speed = WeatherForecast.where(user_id: current_user.id).pluck(:wind_speed).join.to_f
    @temp_max = WeatherForecast.where(user_id: current_user.id).pluck(:temp_max).join.to_i
    @temp_min = WeatherForecast.where(user_id: current_user.id).pluck(:temp_min).join.to_i
    @hair_type = HairsFeature.where(user_id: current_user.id).pluck(:hair_type).join
  end
end
