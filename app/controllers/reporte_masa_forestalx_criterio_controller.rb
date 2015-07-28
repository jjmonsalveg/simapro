class ReporteMasaForestalxCriterioController < ApplicationController

  def index
    @parcela_inventario = ParcelaInventario.por_unidad_manejo(current_user.unidad_manejo_id)
    @tipo_parcela_inventarios = ParcelaInventario.get_parcelas_tpi(current_user.unidad_manejo_id, TipoParcelaInventario.all.order(:id).first.id)
    p @tipo_parcela_inventarios.inspect

  end

  def procesar
    respond_to do |format|
      format.json {render json: MasaForestal.get_masa_forestal(params[:tipo_inventario_id], params[:parcela_id], params[:tipo_criterio], params[:especificacion_diametrica_val])}
    end
    # render partial: 'masa_especie', collection: MedicionParcelaInventario.get_masa_forestal(params[:tipo_inventario_id], params[:parcela_id], params[:tipo_criterio], params[:especificacion_diametrica_val])
  end

  def find_parcelas_por_tipo_inventario
    p "find_parcelas_por_tipo_inventario"
    respond_to do |format|
      p "find_parcelas_por_tipo_inventario1"
      format.json {render json: ParcelaInventario.get_parcelas_tpi(current_user.unidad_manejo_id, params[:tipo_inventario_id]), :only => [:id, :azimut]}
    end
  end

  def imprimir
  end

  def exportar
  end

end
