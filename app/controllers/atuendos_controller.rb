class AtuendosController < ApplicationController


  # before_action :finder_guardarropa, :require_user
  before_action :finder_guardarropa
  before_action :set_guardarropa
  before_action :set_atuendo, only: [:show, :edit, :update, :destroy]
  def index
    @atuendos=Atuendo.where(guardarropa: @guardarropa)
    @atuendos= @atuendos.filter_by_estacion(params[:estacion_tag].presence).filter_by_ocasion(params[:ocasion_tag].presence).filter_by_tiempo(params[:tiempo_tag].presence).ordered_by_puntaje(params[:puntaje_order].presence)
    filter_memory

  end

  def edit
    asignar_partes
    @atuendo = Atuendo.find(params[:id])
  end

  def update
    @atuendo = Atuendo.find(params[:id])
    if @atuendo.update(atuendos_params)
      render :show
    else
      render :edit
    end

  end

  def generate

    @atuendo=Atuendo.new
    @prenda_cabeza=  Guardarropa.find(params[:guardarropa_id]).prendas.joins(:prenda_tipo).where(prenda_tipos: {categoria: :cabeza}).order('RANDOM()').first
    @prenda_torso=   Guardarropa.find(params[:guardarropa_id]).prendas.joins(:prenda_tipo).where(prenda_tipos: {categoria: :torso}).order('RANDOM()').first
    @prenda_piernas= Guardarropa.find(params[:guardarropa_id]).prendas.joins(:prenda_tipo).where(prenda_tipos: {categoria: :piernas}).order('RANDOM()').first
    @prenda_pies=    Guardarropa.find(params[:guardarropa_id]).prendas.joins(:prenda_tipo).where(prenda_tipos: {categoria: :pies}).order('RANDOM()').first

    if(!@prenda_cabeza || !@prenda_torso || !@prenda_piernas || !@prenda_pies)
      redirect_to guardarropa_path(@guardarropa), notice: "Para crear un atuendo necesitas al menos una prenda de cada tipo"
    end

  end

  def show
    @atuendo= Atuendo.find(params[:id])
  end

  def new
    asignar_partes
    @atuendo= Atuendo.new
  end

  def create

    @atuendo=Atuendo.new(atuendos_params)

    if (@guardarropa.atuendos << @atuendo)

      redirect_to action: :index
    end

  end

  def destroy
    @atuendo= Atuendo.find(params[:id])
    Atuendo.destroy(params[:id])
    redirect_to action: :index
  end

  private

  def atuendos_params
    params.require(:atuendo).permit( :torso_id, :cabeza_id, :piernas_id, :pies_id, :puntaje, :estacion_tag, :tiempo_tag, :ocasion_tag, :descripcion, :nombre )
  end

  def set_atuendo
    @atuendo = Atuendo.find(params[:id])

  end

  def set_guardarropa
    @guardarropa= Guardarropa.find(params[:guardarropa_id].to_i)
  end

  def asignar_partes
    @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza
    @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso
    @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas
    @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies
  end

  def finder_guardarropa
    @guardarropa= Guardarropa.find_by(id: params[:guardarropa_id], user: current_user)
  end

  # def validar_usuario
  #   if !(Atuendo.find(params[:id]).user == current_user)
  #     render :index, status: 403
  #   end
  # end

  def filter_memory
    @estacion_selected = params[:estacion_tag].presence
    @tiempo_selected = params[:tiempo_tag].presence
    @formalidad_selected = params[:ocasion_tag].presence
    @puntaje_order = params[:puntaje_order].presence
  end


end
