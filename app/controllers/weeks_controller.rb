class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id))
		redirect_to residence_path(@residence)
	end

	def update
		@week= Week.find(params[:id])
		@week.update(params.require(:week).permit(:status_id))
		@week.save
		redirect_to edit_week_sales_path
	end
	
	def new
		@residence = Residence.find(params[:residence_id])	
		@week = @residence.weeks.new
	end

	def index
		@residence = Residence.find(params[:residence_id])	
	end
end
