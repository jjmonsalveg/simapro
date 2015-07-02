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
    @parcela_inventario.medicion_parcela_inventarios.first || @parcela_inventario.medicion_parcela_inventarios.build
    render partial: 'form'
  end

  def wf_save_estatico

  end


  private
    def self.permission
      :mediciones_inventario
    end
end