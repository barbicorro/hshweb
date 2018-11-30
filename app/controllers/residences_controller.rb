class ResidencesController < ApplicationController
  

  def index
      @residences = Residence.all
  end

  def home
    @residences = Residence.all
  end

  def new
    @residence = Residence.new
  end


  def edit
    @residence = Residence.find(params[:id])
  end

  def show
    @residence = Residence.find(params[:id])
  end

  def update
    @residence = Residence.find(params[:id])
    if @residence.update(residence_params)
       redirect_to residences_path , notice: "La residencia fue modificada exitosamente"
     else
       render :edit
     end
  end

  def create
    @residence =Residence.new(residence_params)
     if @residence.save
        (1..52).each do |i|
          @week = Week.create({period: Date.commercial(2019, i,1), status_id: 1, residence_id: @residence.id})  
        end
        redirect_to residences_path , notice: 'La residencia fue publicada exitosamente'
     else
        redirect_to new_residence_path , notice: 'La residencia ya existe'
     end
   end
   
	def destroy
	  @residence = Residence.find(params[:id])
    if @residence.destroy
      redirect_to residences_path,notice: "La residencia se elimino exitosamente"
    else 
      redirect_to residences_path,notice: "Error al eliminar la residencia"
    end
	end

  def residence_params
    params.require(:residence).permit(:title,:address,:description,:country,:province,:locality,:image)
  end

end
