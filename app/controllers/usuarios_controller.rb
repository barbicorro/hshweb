class UsuariosController < ApplicationController

	def index
   		@usuarios = User.all
  	end

	def show
	    @usuario = User.find(params[:id])
	end

	def reserveList
		@usuario = User.find(params[:usuario_id])
		@week1 = @usuario.week1_id ? Week.find(@usuario.week1_id) : nil
		@week2 = @usuario.week2_id ? Week.find(@usuario.week2_id) : nil
	end
end
