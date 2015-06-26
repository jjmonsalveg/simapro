class EspeciesController < ApplicationController
  before_action :set_especie, only: [:show, :edit, :update, :destroy,:wf_crear_usos,:ajax_especie_usos]
  before_action :authenticate_user!

  respond_to :html

  def index
    @especies = Especie.all
    respond_with(@especies)
  end

  def show
    respond_with(@especie)
  end

  def new
    @especie = Especie.new
    respond_with(@especie)
  end

  def edit
  end

  def create
    @especie = Especie.new(especie_params.merge(empresa_forestal_id: current_user.empresa_forestal.id))
    @especie.save
    respond_with(@especie)
  end

  def update
    @especie.update(especie_params)
    respond_with(@especie)
  end

  def destroy
    @especie.destroy
    respond_with(@especie)
  end

  def wf_asignar_usos
    @especies = current_user.empresa_forestal.especies
    redirect_to new_especie_path, flash:{ warning: 'Debe crear primero alguna Especie forestal'} if @especies.empty?
  end

  def wf_crear_usos
    @especie.update(usos_params)
  end

  def ajax_especie_usos
    render partial: 'form_usos'
  end

  private
  def set_especie
    @especie = current_user.empresa_forestal.especies.find_by(id: params[:id])
  end

  def especie_params
    params.require(:especie).permit(:nombre_comun, :nombre_cientifico, :sinonimia, :familia, :dmc, :densidad, :grupo_especie_id, :empresa_forestal_id)
  end

  def usos_params
    if  params[:especie].nil?
      p params[:especie]={}
      params[:especie][:tipo_uso_especie_ids]=[]
    end
    params.require(:especie).permit(tipo_uso_especie_ids:[])
  end
end
