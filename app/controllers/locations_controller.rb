class LocationsController < ApplicationController
 def index
    @locations = Location.all
  end


  def new
    @location = Location.new
  end


  def create
    @location =Location.new(params.require(:location).permit(:country,:province,:locality))
     if @location.save
       redirec_to locations_path
     else
       render :new
     end
   end
   
	def delete
	  @location = Location.find(params[:id])
	  
	  #falta pedir confirmacion
	end




end
