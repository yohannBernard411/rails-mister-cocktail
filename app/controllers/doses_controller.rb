class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new()
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = params[:cocktail_id]
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktails_path(params[@dose.cocktail_id])
  end

  private

  def params_dose
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end

end