class AdviceMaterialsController < ApplicationController
  def new
    @advice_material = AdviceMaterial.new
  end
    
  def create
    @advice_material = current_user.advice_materials.build(advice_material_params)
    if @advice_material.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end
    
  private
    
  def advice_material_params
    params.require(:advice_material).permit(:city, :forecast_date)
  end  
end
