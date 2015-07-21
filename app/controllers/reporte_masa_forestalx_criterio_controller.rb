class ReporteMasaForestalxCriterioController < ApplicationController

  def index
    @parcela_inventario = ParcelaInventario.por_unidad_manejo(current_user.unidad_manejo_id)
  end

  def procesar
  end

  def imprimir
  end

  def exportar
  end

end
