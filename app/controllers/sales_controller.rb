class SalesController < ApplicationController

  def create
    @week = Week.find(params[:week_id])
    @sale = @week.sales.create(params.require(:sale).permit(:fechaInicio,:horaInicio,:precioBase))
    redirect_to root
  end

  def new
    @week = Week.find(params[:week_id]) 
    @sale = @week.build_sale
  end

  def show
  	@week = Week.find(params[:week_id]) 
    @sale = @week.sale
  end

  def edit
    @week = Week.find(params[:week_id]) 
    @sale = @week.sale
  end

  def update
    @week = Week.find(params[:week_id]) 
    @sale = @week.sale
    if (params[:sale][:precioPuja].to_f > @sale.precioPuja)
      if @sale.update(params.require(:sale).permit(:precioPuja))
         redirect_to edit_week_sales_path, notice: "Su puja fue exitosamente procesada"
      else
        render :edit
      end
    else
      redirect_to edit_week_sales_path, notice: "Su puja debe ser mayor al monto actual"
    end
  end

end