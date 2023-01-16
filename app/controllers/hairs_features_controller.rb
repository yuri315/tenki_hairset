class HairsFeaturesController < ApplicationController
  def new
    @hairs_feature = HairsFeature.new
  end
        
  def create
    @hairs_feature = current_user.hairs_features.build(hairs_feature_params)
    if @hairs_feature.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end
        
  private  
  def hairs_feature_params
    params.require(:hairs_feature).permit(:hair_type)
  end 
end