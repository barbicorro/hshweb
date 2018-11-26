class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id))
		redirect_to residence_path(@residence)
	end
	def updateStatus
		@week= Week.find(params[:id])
		@week.update({period: @week.period, status_id: 2, residence_id: @week.residence_id})
		@week.save
	end
	
	def new
		@residence = Residence.find(params[:residence_id])	
		@week = @residence.weeks.new
	end
end
