class PasswordResetsController < ApplicationController
  def new
  end

  def create

    @user=User.find_by_email(email: params[:email])
    # @user.save!
    if @user.present?
    PasswordMailer.with(user: @user).reset.deliver_now
      binding.irb
    end

    redirect_to root_path, notice: "Si se encuentra una cuenta asociada a ese email, te hemos enviado un link para recuperar tu contraseña."

  end

  def edit
    @user=User.find_signed(params[:token], purpose:"password_reset")
  end
end