class EspeciesController < ApplicationController
  before_action :set_especie, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
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

  private
    def set_especie
      @especie = Especie.find(params[:id])
    end

    def especie_params
      params.require(:especie).permit(:nombre_comun, :nombre_cientifico, :sinonimia, :familia, :dmc, :densidad, :grupo_especie_id, :empresa_forestal_id)
    end
end
