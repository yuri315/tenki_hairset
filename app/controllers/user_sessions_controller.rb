class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password]) 
    if @user && @user.full_register
      redirect_to new_weather_forecast_path, success: t('.success') 
    elsif @user && @user.no_hairs_feature
      redirect_to new_hairs_feature_path, success: t('.success')
    elsif @user && @user.no_advice_material
      redirect_to new_advice_material_path, success: t('.success')
    elsif @user && @user.no_register
      redirect_to new_advice_material_path, success: t('.success')
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