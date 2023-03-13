class HairsFeaturesController < ApplicationController
  before_action :set_hairs_feature,only: %i[edit update]
  def new
    @hairs_feature = HairsFeature.new
  end

  def create
    @hairs_feature = current_user.hairs_features.build(hairs_feature_params)
    if  current_user.hairs_features.exists?
      flash.now[:danger] = t('.fail')
      render :new
    elsif
      @hairs_feature.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit
  end

  def update
    if @hairs_feature.update(hairs_feature_params)
      redirect_to user_information_path, success: t('defaults.message.update', item: HairsFeature.model_name.human)
    else 
      flash.now[:danger] = t('defaults.message.update_fail', item: HairsFeature.model_name.human)
      render :edit
    end
  end
    
        
  private
  def hairs_feature_params
    params.require(:hairs_feature).permit(:hair_type)
  end 
  def set_hairs_feature
    @hairs_feature = current_user.hairs_features.find(current_user.id)
  end
end