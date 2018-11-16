class SalesController < ApplicationController
	def new
    	@sale = Sale.new
  end

  	def edit
    	@sale = Sale.find(params[:id])
  	end

	def update
    	@sale = Sale.find(params[:id])
    	if @sales.update(params.require(:sale).permit(:fechaInicio, :fechaFin))
       		redirect_to sales_path , notice: "La subasta fue modificada exitosamente"
     	else
            render :edit
     end
 end

  def create
    @sale =Sale.new(params.require(:sale).permit(:fechaInicio,:fechaFin))
     if @sale.save
       redirect_to sales_path , notice: "La subasta fue creada exitosamente"
      else
       render :new
     end
   end
end

