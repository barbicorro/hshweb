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
    if @residence.update(params.require(:residence).permit(:title,:address,:description,:country,:province,:locality,:image))
       redirect_to residences_path , notice: "La residencia fue modificada exitosamente"
     else
       render :edit
     end
  end

  def create
    @residence =Residence.new(params.require(:residence).permit(:title,:address,:description,:country,:province,:locality,:image))
     if @residence.save
       redirect_to residences_path , notice: 'La residencia fue publicada exitosamente'
     else
        render :new 
     end
   end
   
	def destroy
	  residence = Residence.find(params[:id])
    if residence.destroy
      redirect_to residences_path,notice: "La residencia se elimino exitosamente"
    else 
            redirect_to residences_path,notice: "Error al eliminar la residencia"
    end

	end

end
