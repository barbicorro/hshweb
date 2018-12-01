class InscriptionsController < ApplicationController

 
 def create
    @week = Week.find(params[:week_id])
    @inscription = @week.build_inscription(params.require(:inscription).permit(:user_id,:week_id))
   
    @inscription.week_id = params[:week_id]
    @inscription.user_id = current_user.id
    if @inscription.save
        redirect_to :back , notice: 'Inscripcion exitosa'
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
    @inscription = Inscription.new
  end


  def edit
    @inscription = Inscription.find(params[:id])
  end

  def show
    @inscription = Inscription.find(params[:id])
  end

end

