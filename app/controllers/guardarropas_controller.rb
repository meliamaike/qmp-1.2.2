class GuardarropasController < ApplicationController
  before_action :require_user
  before_action :set_guardarropa, only: [:show, :update, :edit, :destroy]
  before_action :validar_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @guardarropas = Guardarropa.page params[:page]
    @guardarropas = @guardarropas.where(user: current_user)
  end

  def show
    @guardarropa = Guardarropa.find(params[:id])

  end

  def create
    @guardarropa=Guardarropa.create(guardarropa_params) # nota: prenda_params NO viene con el controller,
    @guardarropa.user = current_user

    if @guardarropa.save
      flash[:success]="El guardarropa se guardó correctamente."
      redirect_to @guardarropa
    else
      flash[:error]="El guardarropa no se pudo guardar"
      render :new
    end


  end

  def new
    @guardarropa = Guardarropa.new

  end

  def edit
    @guardarropa = Guardarropa.find(params[:id])
  end

  def update
    @guardarropa = Guardarropa.find(params[:id])
    @guardarropa.update! guardarropa_params
    redirect_to @guardarropa
  end

  def destroy
    @guardarropa = Guardarropa.find(params[:id])
    Guardarropa.destroy(params[:id])
    redirect_to action: :index

  end

  private

  def set_guardarropa
    @guardarropa = Guardarropa.find(params[:id])

  end

  def guardarropa_params
    params.require(:guardarropa).permit(:guardarropa_id, :nombre)

  end

  def validar_usuario
    if !(Guardarropa.find(params[:id]).user == current_user)
      render :index, status: 403
    end
  end
end
