class InscriptionsController < ApplicationController


 def create
    @week = Week.find(params[:week_id])
    if @inscription = @week.inscriptions.create(params.require(:inscription).permit(:week_id,:user_id))
        redirect_to root_path , notice: 'Inscripcion exitosa'
    else
      render :new
    end
  end
  def index
  	if (user_signed_in?)
      @inscription = Inscription.all
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @week = Week.find(params[:week_id])
    @inscription = @week.inscriptions.new
  end


  def edit
    @inscription = Inscription.find(params[:id])
  end

  def show
    @inscription = Inscription.find(params[:id])
  end



    def update
      @week = Week.find(params[:week_id])
      @inscription = @week.inscription
        if @sale.update(params.require(:inscription).permit(:week_id,:user_id))
           redirect_to edit_week_inscriptions_path, notice: "Modificación de inscripcion exitosa"
        else
          render :edit
        end
      else
        redirect_to edit_week_inscriptions_path, notice: "Error al modificar inscripcion"

    end



end
