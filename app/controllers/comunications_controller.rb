class ComunicationsController < ApplicationController

	def index
		if (user_signed_in?)
	      @comunications = Comunication.all
	    else
	      redirect_to new_user_session_path
	    end
	end

	def new
		if (user_signed_in?)
	      @comunication = Comunication.new
	    else
	      redirect_to new_user_session_path
	    end
	end

	def create
		@comunication = Comunication.new(params.require(:comunication).permit(:email,:subject,:message))
	 	if @comunication.save
	    	redirect_to root_path , notice: 'Mensaje enviado exitosamente'
	 	else
	    	render :new , notice: 'Disculpas, el mensaje no pudo ser envíado'
     	end
	end

	def show
		if (user_signed_in?)
	      @comunication = Comunication.find(params[:id])
	    else
	      redirect_to new_user_session_path
	    end		
	end
end
