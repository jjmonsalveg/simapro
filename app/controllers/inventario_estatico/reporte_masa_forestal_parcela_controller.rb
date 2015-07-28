class InventarioEstatico::ReporteMasaForestalParcelaController < ApplicationController
  before_action :authenticate_user!
  # authorize_resource class: :reporte_masa_forestal_parcela

  def index
  end

  def wf_load_table_masa_parcela
    render partial: 'table_masa_parcela'
  end

  private
    def self.permission
      :reporte_masa_forestal_parcela
    end
end