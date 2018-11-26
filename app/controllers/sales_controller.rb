class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end
  def inicio
  	 @week = Week.find(params[:week_id])
  	 @week.updateStatus
  end
  def create
    @week = Week.find(params[:week_id])
    @sale = @week.sales.create(params.require(:sale).permit(:fechaInicio,:horaInicio,:precioBase))
    redirect_to root
  end

  def new
    @week = Week.find(params[:week_id])  
    @sale = @week.build_sale
  end

end