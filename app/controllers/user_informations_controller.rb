class UserInformationsController < ApplicationController
  before_action :set_user,only: %i[show edit update]
  before_action :set_advice_material,only: %i[show]
  before_action :set_hairs_feature,only: %i[show]
  def show
    @city_id = current_user.advice_material.city_id
    @date = current_user.advice_material.forecast_date
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_information_path, success: t('defaults.message.update', item: User.model_name.human)
    else 
      flash.now[:danger] = t('defaults.message.update_fail', item: User.model_name.human)
      render :edit
    end
end

  private
  def user_params
    params.require(:user).permit(:email, :last_name, :first_name)
  end
  def set_user
    @user = User.find(current_user.id)
  end
  def set_advice_material
    @advice_material = current_user.advice_material
  end
  def set_hairs_feature
    @hairs_feature = current_user.hairs_feature
  end
end
