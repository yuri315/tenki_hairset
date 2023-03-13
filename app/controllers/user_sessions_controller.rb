class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      if current_user.advice_material.present? && current_user.hairs_features.present?
        redirect_to new_weather_forecast_path, success: t('.success') 
      elsif current_user.advice_material.present? && !current_user.hairs_features.present?
        redirect_to new_hairs_feature_path, success: t('.success')
      else
        redirect_to new_advice_material_path, success: t('.success')
      end
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end
end
