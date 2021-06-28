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
    @token=params[:token]
    @user=GlobalID::Locator.locate_signed @token
  end

  def update
    @token=params[:token]
    @user=GlobalID::Locator.locate_signed @token

    if @user.update(password_params)
      flash[:alert] = 'Tu contraseña se actualizó correctamente.'
      redirect_to login_path
    else
      flash[:alert]= 'No concuerdan las contraseñas.Intenta de vuelta'
      render 'edit'
    end

  end




  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end