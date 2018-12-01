class UsuariosController < ApplicationController

def index
    @usuarios = User.all
  end

  def show
    @usuario = User.find(params[:id])
  end

end
