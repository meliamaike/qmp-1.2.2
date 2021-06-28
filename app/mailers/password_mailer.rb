class PasswordMailer < ApplicationMailer

  def reset

    @user=params[:user]

    @token=@user.to_signed_global_id(expires_in: 15.minutes)

    mail(to: @user.email, subject: 'Reseteo de contraseña')
  end

  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Reseteo de contraseña')
  end
end
