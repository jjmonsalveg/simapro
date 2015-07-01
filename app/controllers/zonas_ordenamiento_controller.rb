class ZonasOrdenamientoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zona_ordenamiento, only: [:show, :edit, :update, :destroy]
  authorize_resource

  respond_to :html

  def index
    @zonas_ordenamiento = current_user.zonas_ordenamiento
    respond_with(@zonas_ordenamiento)
  end

  def show
    respond_with(@zona_ordenamiento)
  end

  def new
    if UnidadOrdenacion.all.empty?
      flash[:warning] = 'Debe crear Alguna unidad de ordenacion antes de Crear Zonas de Ordenamiento'
      redirect_to unidad_ordenaciones_path
      return
    end
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
      @zona_ordenamiento = current_user.zonas_ordenamiento.select{|z| z.id == params[:id].to_i }[0]

      if @zona_ordenamiento.nil?
        flash[:warning]= 'Zona de ordenamiento no existente para sus Empresas Forestales'
        redirect_to zonas_ordenamiento_path
      end
    end

    def zona_ordenamiento_params
      params.require(:zona_ordenamiento).permit(:nombre, :abreviado, :ubicacion, :area, :usos,
                                                :descripcion,:unidad_ordenacion_id, municipio_ids:[],
                                                documentos_attributes:[:id, :documentos_requisitos_por_vista_id,:doc])
    end
end
