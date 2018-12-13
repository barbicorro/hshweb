class UsersController < ApplicationController
  def change_admin

  @usuario= User.find(params[:user_id])
  if(current_user.user_type_id==4)
      @usuario.user_type_id = 1
      if @usuario.save
        redirect_to users_path,notice: "el usuario ahora es un administrador"
      else
        redirect_to users_path, notice: "Error al modificar el tipo de usuario"
      end
    else
      redirect_to users_path, notice: "No contas con permiso para realizar esta accion"
end
end

def change_base
    @usuario= User.find(params[:user_id])
    @usuario.user_type_id = 3
    if(current_user.user_type_id==4 || current_user.user_type_id ==1)
        if @usuario.save
          redirect_to users_path,notice: "el usuario ha cambiado de membresia"
        else
          redirect_to users_path, notice: "Error al cambiar la membresia"
        end
      else
        redirect_to users_path, notice: "No contas con permiso para realizar esta accion"
      end
end

def change_premium
    @usuario= User.find(params[:user_id])
    @usuario.user_type_id = 2
    if(current_user.user_type_id==4 || current_user.user_type_id ==1)
          if @usuario.save
            redirect_to users_path,notice: "El usuario ha cambiado de membresia"
          else
            redirect_to users_path, notice: "Error al cambiar la membresia"
          end
    else
      redirect_to users_path, notice: "No contas con permiso para realizar esta accion"
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
    if (current_user.user_type_id == 2 || current_user.user_type_id == 3)
      @usuario = current_user
      @week1 = @usuario.week1_id ? Week.find(@usuario.week1_id) : nil
      @week2 = @usuario.week2_id ? Week.find(@usuario.week2_id) : nil
      if @week1 != nil
        @week1.status_id = 4
        @week1.user_id = nil
        if @week1.sale != nil
          @week1.sale_id = nil
          @week1.sale.destroy
        end
        @week1.save
      end
      if @week2 != nil
        @week2.status_id = 4
        @week2.user_id = nil
        if @week2.sale != nil
          @week2.sale_id = nil
          @week2.sale.destroy
        end
        @week2.save
      end
      if (@usuario.destroy)
        redirect_to root_path,notice: "¡Adiós! Tu cuenta ha sido cancelada correctamente. Esperamos verte pronto."
      else
        redirect_to root_path,notice: "Error al cancelar cuenta"
      end
    elsif (current_user.user_type_id == 4)
      @usuario =User.find(params[:id])
      if (@usuario.destroy)
        redirect_to user_indexAdmin_path(current_user),notice: "Cuenta del administrador eliminada exitosamente"
      else
        redirect_to user_indexAdmin_path(current_user),notice: "Error al cancelar cuenta"
      end
    elsif (current_user.user_type_id == 1)
      @usuario = current_user
      if (@usuario.destroy)
        redirect_to root_path,notice: "¡Adiós! Tu cuenta ha sido cancelada correctamente. Esperamos verte pronto."
      else
        redirect_to root_path,notice: "Error al cancelar cuenta"
      end
    end
  end

end
