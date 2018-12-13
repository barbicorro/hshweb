class WeeksController < ApplicationController
	def create
		@residence = Residence.find(params[:residence_id])
		@week = @residence.weeks.create(params.require(:week).permit(:period,:status_id,:residence_id,:term))
		redirect_to residence_path(@residence)
	end

	def cancel
		if (user_signed_in?)
	      @week= Week.find(params[:week_id])
	    else
	      redirect_to new_user_session_path
	    end
	end

	def update
		@week= Week.find(params[:id])
		if @week.update(update_params)
			if (params[:week][:status_id].to_i == 1) #no la puede reservar, mantiene el estado
				redirect_to residences_path , notice: "Ya tienes una reserva en la semana deseada"
			elsif (params[:week][:status_id].to_i == 2) #pasar a estado subasta
       			redirect_to edit_week_sales_path(@week) , notice: "La subasta ha iniciado"
	    	elsif (params[:week][:status_id].to_i == 3) #pasar a estado reservada
	     		@residence = Residence.find(@week.residence_id)
	     		if @week.sale != nil
	     			@week.sale_id = nil
	     			@week.sale.destroy
	     		end
	     		@user = User.find(params[:week][:user_id])
	     		if (@user.week1_id == nil)
	     			@user.week1_id = @week.id
	     		else
	     			@user.week2_id = @week.id
	     		end
	     		@user.credits -= 1
	     		@user.save
	     		if (current_user.user_type_id == 1 || current_user.user_type_id == 4)
					redirect_to residence_weeks_path(@residence) , notice: "La subasta ha finalizado"
				elsif (current_user.user_type_id == 2 || current_user.user_type_id == 3)
					redirect_to user_reserveList_path(current_user.id), notice: "Reserva exitosa"
				end
	       	elsif (params[:week][:status_id].to_i == 4) #pasar a hotsale
	       		if @week.sale != nil
	     			@week.sale_id = nil
	     			@week.sale.destroy
	     		end
	       		if (current_user.user_type_id == 2 || current_user.user_type_id == 3)
		       		@week.user_id = nil
		       		@week.save
		       		@user = current_user
		       		if (@user.week1_id == @week.id && @user.week2_id != nil)
		     			@user.week1_id = @user.week2_id
		     			@user.week2_id = nil
		     		elsif (@user.week1_id == @week.id && @user.week2_id == nil)
		     			@user.week1_id = nil
		     		elsif (@user.week2_id == @week.id)
		     			@user.week2_id = nil
		     		end
		       		@user.credits += 1
		       		@user.save
		       		redirect_to user_reserveList_path(current_user.id), notice: "Cancelación exitosa. Le ha sido devuelto 1 crédito."
	       		elsif (current_user.user_type_id == 1 || current_user.user_type_id == 4)
	       			@residence = Residence.find(@week.residence_id)
	     	  		redirect_to user_reserveList_path(current_user.id), notice: "La residencia paso a estar en HotSale"
	     	  	end
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
		if (user_signed_in?)
	      @week= Week.find(params[:id])
	    else
	      redirect_to new_user_session_path
	    end
	end

	def weekList
		@weeks = Week.all
	end

	def update_params
		params.require(:week).permit(:status_id,:user_id)
	end

end
