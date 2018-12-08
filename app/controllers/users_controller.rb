class UsersController < ApplicationController
  def change_admin

  @usuario= User.find(params[:user_id])
  @usuario.user_type_id = 1
  if @usuario.save
    redirect_to users_path,notice: "el usuario ahora es un administrador"
  else
    redirect_to users_path, notice: "Error al modificar el tipo de usuario"
  end

end

def change_base

@usuario= User.find(params[:user_id])
@usuario.user_type_id = 3
if @usuario.save
  redirect_to users_path,notice: "el usuario ha cambiado de membresia"
else
  redirect_to users_path, notice: "Error al cambiar la membresia"
end

end

def change_premium

@usuario= User.find(params[:user_id])
@usuario.user_type_id = 2
if @usuario.save
  redirect_to users_path,notice: "el usuario ha cambiado de membresia"
else
  redirect_to users_path, notice: "Error al cambiar la membresia"
end

end


  def indexAdmin
      @usuarios = User.all

        end
  def index
    @usuarios = User.all
  end

	def show
	    @usuario = User.find(params[:id])
	end

	def reserveList
		@usuario = User.find(params[:user_id])
		@week1 = @usuario.week1_id ? Week.find(@usuario.week1_id) : nil
		@week2 = @usuario.week2_id ? Week.find(@usuario.week2_id) : nil
	end

  def destroy
    @usuario =User.find(params[:id])
    if @usuario.destroy
      redirect_to user_indexAdmin_path(current_user),notice: "el usuario se elimino exitosamente"
    else
      redirect_to user_indexAdmin_path(current_user),notice: "Error al eliminar el usuario"
    end
  end

end
