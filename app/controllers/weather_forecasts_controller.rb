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
      WeatherForecast.find_or_initialize_by(advice_material_id: @advice_material.id).update!(params_weather)
      flash[:notice] = "登録に成功しました"
    elsif response!= "error" && @advice_material.forecast_date == "明日"
      params_weather = Api::OpenWeatherMap::Request.attributes_for(response['daily'][1])
      WeatherForecast.find_or_initialize_by(advice_material_id: @advice_material.id).update!(params_weather)
      flash[:notice] = "登録に成功しました!"
    else
      flash[:notice] = "天気情報の取得に失敗しました"
    end 
  end
  def index
  end
end
