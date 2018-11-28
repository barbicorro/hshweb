class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id))
		redirect_to residence_path(@residence)
	end

	def update
		@week= Week.find(params[:id])
		if @week.update(params.require(:week).permit(:status_id))
	       redirect_to edit_week_sales_path(@week) , notice: "La subasta ha iniciado"
	     else
	       redirect_to weeks_path , notice: "Ha habido algún problema con la inicialización de la subasta"
	     end
	end
	
	def new
		@residence = Residence.find(params[:residence_id])	
		@week = @residence.weeks.new
	end

	def index
		@residences = Residence.all
	end

	def edit
		@week= Week.find(params[:id])
	end
end
