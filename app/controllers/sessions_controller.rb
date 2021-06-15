class SessionsController < ApplicationController


  def new
  #Cuando el controller esta vacio, renderiza la vista
    # redirect_to action: :index
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to guardarropas_path, notice: "Te logueaste :)"
    else
      flash.now[:alert] = "Tu contraseña o email son incorrectos"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Te deslogueaste! Nos vemos pronto"
    redirect_to login_path
  end

  def profile
    @guardarropas = Guardarropa.where(user: current_user)
    @atuendos=Atuendo.where(user:current_user)
    @prendas = Prenda.where(user:current_user)


  end



end
