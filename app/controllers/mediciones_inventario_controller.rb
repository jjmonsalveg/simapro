class MedicionesInventarioController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :mediciones_inventario

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
    respond_to do |format|
      format.json{ render json: parcela_inventario_params.to_json }
    end
  end


  private
    def self.permission
      :mediciones_inventario
    end

    def parcela_inventario_params
      params.require(:parcela_inventario).permit(medicion_parcela_inventario: [:fecha_inicio, :fecha_fin, :tecnico, :baquiano])
    end
end