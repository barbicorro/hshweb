class SalesController < ApplicationController

  def new
    @residence = Residence.find(params[:residence_id])  
    @sale = @residence.sales.new
  end

  def create
    @residence = Residence.find(params[:residence_id])
    @sale = @residence.sales.create(params.require(:sale).permit(:fechaInicio,:horaInicio,:precioBase,:week_id))
    redirect_to residence_path(@residence)
  end
end