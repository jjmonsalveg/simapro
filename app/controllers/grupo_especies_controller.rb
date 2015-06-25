class GrupoEspeciesController < ApplicationController
  before_action :set_grupo_especie, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @grupo_especies = GrupoEspecie.all
    respond_with(@grupo_especies)
  end

  def show
    respond_with(@grupo_especie)
  end

  def new
    @grupo_especie = GrupoEspecie.new
    respond_with(@grupo_especie)
  end

  def edit
  end

  def create
    @grupo_especie = GrupoEspecie.new(grupo_especie_params)
    @grupo_especie.save
    respond_with(@grupo_especie)
  end

  def update
    @grupo_especie.update(grupo_especie_params)
    respond_with(@grupo_especie)
  end

  def destroy
    @grupo_especie.destroy
    respond_with(@grupo_especie)
  end

  private
    def set_grupo_especie
      @grupo_especie = GrupoEspecie.find(params[:id])
    end

    def grupo_especie_params
      params.require(:grupo_especie).permit(:nombre, :codigo)
    end
end
