class PasswordResetsController < ApplicationController

  def new
  #   solo renderiza el form
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to login_path, notice: "Te hemos enviado un link para recuperar tu contraseña."



  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")

  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end