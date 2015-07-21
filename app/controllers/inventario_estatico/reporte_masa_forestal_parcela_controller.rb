class InventarioEstatico::ReporteMasaForestalParcelaController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :reporte_masa_foresta_parcela

  def index

  end

  private
    def self.permission
      :reporte_masa_foresta_parcela
    end
end