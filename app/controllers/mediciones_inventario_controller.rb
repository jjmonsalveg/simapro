class MedicionesInventarioController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :mediciones_inventario

  def wf_estatico
  end

  def wf_select_parcela_inventario
    render partial: 'select_parcela_inventario'
  end


  private
    def self.permission
      :mediciones_inventario
    end
end