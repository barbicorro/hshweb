class UsuariosController < ApplicationController

  def indexAdmin
      @usuarios = User.all

        end
def index
    @usuarios = User.all
  end

  def show
    @usuario = User.find(params[:id])
  end

  def destroy
    @usuario =User.find(params[:id])
    if @usuario.destroy
      redirect_to usuario_indexAdmin_path(current_user),notice: "el usuario se elimino exitosamente"
    else
      redirect_to usuario_indexAdmin_path(current_user),notice: "Error al eliminarel usuario"
    end
  end

end
