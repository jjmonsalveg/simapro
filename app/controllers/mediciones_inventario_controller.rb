class MedicionesInventarioController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :mediciones_inventario

  respond_to :html, :json

  include MedicionesInventario

  def wf_estatico
  end

  def wf_select_parcela_inventario
    render partial: 'select_parcela_inventario'
  end

  def wf_load_form
    @parcela_inventario = ParcelaInventario.find_by(parcela_manejo_id: params[:parcela_id]) || ParcelaInventario.new
    render partial: 'form'
  end

  def wf_load_form_tipo_parcela
    @parcela_inventario = ParcelaInventario.find_by(parcela_manejo_id: params[:parcela_id]) || ParcelaInventario.new
    @medicion_parcela_inventario = @parcela_inventario.medicion_parcela_inventarios.find_by(tipo_parcela_inventario_id: params[:tipo_parcela_inventario]) || @parcela_inventario.medicion_parcela_inventarios.build
    render partial: 'form_tipo_estatico'
  end


  def wf_save_estatico
    MedicionesInventario.save_mediciones_inventario(params, current_user)
    respond_to do |format|
      format.json{ render json: parcela_inventario_params.to_json }
    end
  end

  def wf_load_especies
    @especies = Especie.joins(:empresa_forestal).where(empresas_forestales: {id: current_user.empresa_forestal_id})
    respond_with(@especies)
  end

  def wf_save_especie
    if params[:especie].present? && Especie.create(nombre_comun: params.require(:especie), empresa_forestal: current_user.empresa_forestal)
      render json: true
    else
      render json: false
    end
  end


  private
    def self.permission
      :mediciones_inventario
    end

    def parcela_inventario_params
      params.require(:parcela_inventario).permit(:coord_norte_utm, :coord_este_utm, :azimut, :id, medicion_parcela_inventario: [:tipo_parcela_inventario_id, :fecha_inicio, :fecha_fin, :tecnico, :baquiano, :medicion_dap])
    end
end