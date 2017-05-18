class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])  #on met cocktail_id par rapport à la route /cocktails/:cocktail_id/new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id]) #on met cocktail_id par rapport à la route /cocktails/:cocktail_id/new
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    raise
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredients)
  end
end
