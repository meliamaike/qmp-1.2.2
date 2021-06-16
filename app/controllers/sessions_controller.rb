class SessionsController < ApplicationController


  def new
  #Cuando el controller esta vacio, renderiza la vista
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/profile'
    else
      flash.now[:alert] = "Tu contraseña o email no son correctos"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def profile
    @guardarropas = Guardarropa.where(user: current_user)
    @atuendos=Atuendo.where(user:current_user)
    @prendas = Prenda.where(user:current_user)
  end

end
