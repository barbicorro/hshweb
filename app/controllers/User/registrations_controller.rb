# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up

  # POST /resource
  def create
   super
   @user=User.new(params.required(:user).permit(:date_venc_month,:date_venc_year,:cod,:card_Number,
      :name,:image,:date_of_birth,:email,:lastname,:password,:password_confirmation,
      :card_Marca)) 
    if @user.save
        redirect_to :back , notice: 'Usuario creado exitosamente'
    else
      render :new
    end



end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
      @user =User.find(params[:id])
      if @user.destroy
        redirect_to root_path,notice: "La cuenta ha sido eliminada exitosamente"
      else
        redirect_to root_path,notice: "Error al eliminar cuenta"
      end
    end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_up_params
   # devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:date_of_birth,:is_female,:email,:password,:password_confirmation])
 #  end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
   #devise_parameter_sanitizer.permit(:account_update, keys: [:name,:date_of_birth,:is_female,:email])

   #end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
