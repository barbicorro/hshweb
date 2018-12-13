class ResidencesController < ApplicationController

  def index
    if (user_signed_in?)
      @residences = Residence.search(term1: params[:term1], term: params[:term])
    else
      redirect_to new_user_session_path
    end
  end

  def home
    @ws= Week.all.where(status_id: 4)

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
        @residence.priceHotSale = (35*(@residence.price))/100
        @residence.save
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
        @residence.priceHotSale = (35*(@residence.price))/100
        @residence.save
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
    params.require(:residence).permit(:title,:address,:description,:price,:country,:province,:locality,:image,:term1,:term)
  end

end
