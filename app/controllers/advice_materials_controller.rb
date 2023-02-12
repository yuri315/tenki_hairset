class AdviceMaterialsController < ApplicationController
  before_action :set_advice_material,only: %i[edit update]
  def new
    @advice_material = AdviceMaterial.new
  end
    
  def create
    @advice_material = current_user.build_advice_material(advice_material_params)

    if @advice_material.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit
  end

  def update
    if @advice_material.update(advice_material_params)
      redirect_to user_information_path, success: t('defaults.message.update', item: AdviceMaterial.model_name.human)
    else 
      flash.now[:danger] = t('defaults.message.update_fail', item: AdviceMaterial.model_name.human)
      render :edit
    end
  end
    
  private
    
  def advice_material_params
    params.require(:advice_material).permit(:forecast_date, :city_id)
  end  

  def set_advice_material
    @advice_material = current_user.advice_material
  end

end
