class PasswordsController < ApplicationController
  before_action :require_user
  def edit

  end

  def update
  if current_user.update(password_params)
    redirect_to login_path, notice: "Contraseña actualizada"
  else
    render :edit
  end
  end

    private
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end


end