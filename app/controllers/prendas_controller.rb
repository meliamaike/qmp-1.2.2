# Importante:
#
# En la arquitectura MVC
# los controladores son responsables de "hablar"
# con el modelo para hacer búsquedas, actualizaciones, etc e incluso algunas operaciones que no caen en la semántica de un CRUD.
# Además, van interactuar con la información proveniente del request HTTP (por ejemplo los parámetros) e indicar qué se tiene que mostrar a continuación
#
# Por otro lado, las vistas se encargan únicamente de mostrar (dibujar aka renderizar) información. NO realizan operaciones como .all, .find, etc.
#
class PrendasController < ApplicationController

  before_action :require_user
  # before_action :set_prenda, only: [:show, :update, :edit, :destroy]
  before_action :validar_user, only: [:show, :edit, :update, :destroy]



  # get /prendas/
  def index
    # @prendas=current_user.prendas.page params[:page]

    # @prendas=current_user.prendas

  end

  # 1. Cuando accedemos a /prendas/1, rails sabe
  # gracias a al routes.rb que hay que dirigir
  # a prendas#show, es decir, ejecutar el método
  # show de la clase (una instancia de la clase)
  # PrendasController
  #
  # 2. Luego el show en clase PrendasController accede a
  # los parámetros (mediante params) y busca en la
  # base de datos la prenda por id (find)
  #
  # 3. Implícitamente, al terminar de evaluar el método show, como no decimos nada en contrario,
  # se va a renderizar la vista views/prendas/show.hml.erb
  #
  # 4. la vista correspondiente dibuja un html utilizando
  # la variable @prenda que fue seteada previamente en el controlador

  # get /prendas/:id
  def show

    if !(Prenda.find(params[:id]).user==current_user)
      redirect_to login_path, notice: t(:error)
    end

  end

  # recordatorio: esto es IGUAL a lo anterior, con la salvedad
  # de que el recurso (ruta http) ahora es /prendas y rails lo mapea automáticamente
  # al método create

  # post /prendas
  def create

    # nota: prenda_params NO viene con el controller,lo tenés que definir vos
    @prenda=Prenda.create(prenda_params)
    @prenda.user = current_user
    @guardarropa = Guardarropa.find(prenda_params[:guardarropa_id])
    redirect_to @guardarropa
  end

  # get /prendas/new
  def new
    @prenda = Prenda.new
    @prenda_prenda_tipo_id=@prenda.prenda_tipo_id
  end

  # put /prendas/:id
  def update
    @prenda.update(prenda_params)
    redirect_to @prenda
  end

  # get /prendas/edit
  def edit
    @prenda = Prenda.find(params[:id])
  end



  def destroy
    @prenda.destroy!
    redirect_to action: :index

  end

  private

  def set_prenda
    @prenda = Prenda.find(params[:id])
  end

  def prenda_params
    # esto vamos a hacerlo siempre así, como una receta,
    # que nos provee rails para manejar de forma segura los campos de un
    # formulario. El require va a llevar el nombre de la clase que queremos manipular
    # y el permit, los campos particulares que nos interesa admitir para editar/crear.
    params.require(:prenda).permit(:material,:color_primario,:color_secundario,:descripcion, :imagen, :guardarropa_id, :prenda_tipo_id)
  end

  def validar_user
    if !(Prenda.find(params[:id]).user == current_user)
      render :index
    end
  end


end


