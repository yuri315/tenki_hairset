class HomeController < ApplicationController
  skip_before_action :require_login
  def top
    if logged_in? && current_user.advice_material.present? && current_user.hairs_feature.present? 
      redirect_to new_weather_forecast_path
    elsif
      logged_in? && current_user.advice_material == nil
      redirect_to new_advice_material_path
    elsif
      logged_in? && current_user.hairs_feature == nil
      redirect_to new_hairs_feature_path
    end
  end
  def sample
  end
end
