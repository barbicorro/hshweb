class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id,:term))
		redirect_to residence_path(@residence)
	end

	def update
		@week= Week.find(params[:id])
		if @week.update(update_params)
			if (params[:week][:status_id].to_i == 2) #pasar a estado subasta
       			redirect_to edit_week_sales_path(@week) , notice: "La subasta ha iniciado"
	    	elsif (params[:week][:status_id].to_i == 3) #pasar a estado reservada
	     		@residence = Residence.find(@week.residence_id)
	     		@week.sale.destroy
	     		@user = User.find(params[:week][:user_id])
	     		if (@user.week1_id == nil)
	     			@user.week1_id = @week.id
	     		else
	     			@user.week2_id = @week.id
	     		end
	     		@user.credits -= 1
	     		@user.save
	       		redirect_to residence_weeks_path(@residence) , notice: "La subasta ha finalizado"
	       	elsif (params[:week][:status_id].to_i == 4)
	       		@residence = Residence.find(@week.residence_id)
	     	  	redirect_to residence_weeks_path(@residence) , notice: "La subasta ha finalizado"
	     	else
	     		@residence = Residence.find(@week.residence_id)
	     	  	redirect_to residence_weeks_path(@residence) , notice: "Ha habido algún problema"
	     	end
	    end 	
	end
	
	def new
		@residence = Residence.find(params[:residence_id])	
		@week = @residence.weeks.new
	end

	def index
		@residence = Residence.find(params[:residence_id])
	end

	def edit
		@week= Week.find(params[:id])
	end

	def weekList
		@weeks = Week.search(params[:term])
	end

	def update_params
		params.require(:week).permit(:status_id,:user_id)
	end
end
