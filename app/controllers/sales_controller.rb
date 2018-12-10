class SalesController < ApplicationController
  def index
    if (user_signed_in?)  
      @residences = Residence.all
    else
      redirect_to new_user_session_path
    end
  end
  def create
    @week = Week.find(params[:week_id])
    @sale = @week.build_sale(params.require(:sale).permit(:fechaInicio,:horaInicio,:precioBase))
    @sale.fechaFin = @sale.fechaInicio + 3
    @sale.precioPuja = @sale.precioBase
    @sale.week_id = params[:week_id]
    @residence = Residence.find(@week.residence_id)
    @sale.residence_id = @residence.id
    if @sale.save
        @week.sale_id = @sale.id
        @week.save
        redirect_to residence_weeks_path(@residence) , notice: 'La subasta fue configurada exitosamente'
    else
      render :new
    end
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
    @week = Week.find(params[:sale][:week_id])
    @sale = @week.sale
    if (params[:sale][:precioPuja].to_f > @sale.precioPuja)
      @sale.ganadorActual = current_user.id
      if @sale.update(params.require(:sale).permit(:precioPuja))
         redirect_to edit_week_sales_path(@week), notice: "Su puja fue exitosamente procesada"
      else
        render :edit
      end
    else
      redirect_to edit_week_sales_path(@week), notice: "Su puja debe ser mayor al monto actual"
    end
  end

  def delete
    @sale = Sale.find(params[:id])
    @sale.destroy

  end

end
