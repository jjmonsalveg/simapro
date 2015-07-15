class ReservaForestalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reserva_forestal, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @reserva_forestales = ReservaForestal.where(empresa_forestal_id: current_user.empresa_forestal_id)
    # respond_with(@reserva_forestales)
  end

  def show
    respond_with(@reserva_forestal)
  end

  def new
    @reserva_forestal = ReservaForestal.new
    respond_with(@reserva_forestal)
  end

  def edit
  end

  def create
    @reserva_forestal = ReservaForestal.new(reserva_forestal_params)
    @reserva_forestal.empresa_forestal_id = current_user.empresa_forestal_id
    respond_to do |format|
      if @reserva_forestal.save
        format.html { redirect_to reserva_forestales_path, notice: 'Reserva Forestal creado satisfactoriamente.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @reserva_forestal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reserva_forestal.update(reserva_forestal_params)
        format.html { redirect_to reserva_forestales_path, notice: 'Reserva Forestal actualizado satisfactoriamente.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reserva_forestal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @reserva_forestal.safe_to_delete
      @reserva_forestal.destroy
      respond_to do |format|
        format.html { redirect_to reserva_forestales_path, notice:  'Reserva Forestal eliminado satisfactoriamente.' }
        format.json { head :no_content }
      end
    end
  end

  def default_or_value_view(param, value)
    param.nil? ? value : param
  end

  helper_method :default_or_value_view

  private
    def set_reserva_forestal
      @reserva_forestal = ReservaForestal.find(params[:id])
    end

    def reserva_forestal_params
      params.require(:reserva_forestal).permit(:empresa_forestal_id,
                                               :nombre,
                                               :abreviado,
                                               :fecha_creacion,
                                               :fecha_reglamento,
                                               :area,
                                               :descripcion,
                                               :unidad_ordenacion_id,
                                               municipio_ids:[],
                                               documentos_attributes:[:id,
                                                                      :documentos_requisitos_por_vista_id,
                                                                      :doc])
    end
end
