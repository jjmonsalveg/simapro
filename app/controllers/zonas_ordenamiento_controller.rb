class ZonasOrdenamientoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zona_ordenamiento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @zonas_ordenamiento = ZonaOrdenamiento.all
    respond_with(@zonas_ordenamiento)
  end

  def show
    respond_with(@zona_ordenamiento)
  end

  def new
    @zona_ordenamiento = ZonaOrdenamiento.new
    respond_with(@zona_ordenamiento)
  end

  def edit
  end

  def create
    @zona_ordenamiento = ZonaOrdenamiento.new(zona_ordenamiento_params)
    @zona_ordenamiento.save
    respond_with(@zona_ordenamiento)
  end

  def update
    @zona_ordenamiento.update(zona_ordenamiento_params)
    respond_with(@zona_ordenamiento)
  end

  def destroy
    @zona_ordenamiento.destroy
    respond_with(@zona_ordenamiento)
  end

  private
    def set_zona_ordenamiento
      @zona_ordenamiento = ZonaOrdenamiento.find(params[:id])
    end

    def zona_ordenamiento_params
      params.require(:zona_ordenamiento).permit(:nombre, :abreviado, :ubicacion, :area, :usos, :descripcion)
    end
end
