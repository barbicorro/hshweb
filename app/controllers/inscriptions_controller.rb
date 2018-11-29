class InscriptionsController < ApplicationController


 def create
    @week = Week.find(params[:week_id])
    @inscription = @week.build_inscription(params.require(:inscription))
    @inscription.week_id = params[:week_id]
    @inscription.user_id = current_user.id
    if @inscription.save
        redirect_to :back , notice: 'Inscripcion exitosa'
    else
      render :new
    end
  end
  def index
      @inscription = Inscription.all
  end

  def new
    @week = Week.find(params[:week_id])
    @inscription = @week.build_inscription
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
