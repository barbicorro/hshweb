class WeeksController < ApplicationController

	def create
    	@residence = Residence.find(params[:residence_id])
    	@week = @residence.weeks.create(params.require(:week).permit(:status))
    	redirect_to residence_path(@residence)
 	end

 	def new
 		@residence = Residence.find(params[:residence_id])
    	@week = @residence.weeks.new
 	end
 
end
