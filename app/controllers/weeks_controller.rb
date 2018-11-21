class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id))
		redirect_to residence_path(@residence)
	end

	def new
		@residence = Residence.find(params[:residence_id])	
		@week = @residence.weeks.new
	end
end
