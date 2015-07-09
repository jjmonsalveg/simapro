class MedicionParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_inventario
  belongs_to :tipo_parcela_inventario

  has_many :arbol_inventario_estaticos
  accepts_nested_attributes_for :arbol_inventario_estaticos , reject_if: :all_blank, allow_destroy: true


  def create_or_update_arbol(nro_cuadricula, fi, nro_arbol, bi, especie, dap_cap, altura_fuste, calidad, empresa_forestal_id)
    arbol = self.arbol_inventario_estaticos.find_by(nro_arbol: nro_arbol)
    especie = Especie.find_by(nombre_comun: especie) ||
              Especie.create(nombre_comun: especie, empresa_forestal_id: empresa_forestal_id)
    dap = self.medicion_dap ? dap_cap : (dap_cap / Math::PI)
    if arbol.nil?
      self.arbol_inventario_estaticos.create(nro_cuadricula: nro_cuadricula,
                                             tipo_fisiografia: fi,
                                             nro_arbol: nro_arbol,
                                             bi: bi,
                                             dap: dap,
                                             altura_fuste: altura_fuste,
                                             tipo_calidad_fuste: calidad,
                                              especie: especie )
    else
      arbol.update(nro_cuadricula: nro_cuadricula,
                   tipo_fisiografia: fi,
                   bi: bi,
                   dap: dap,
                   altura_fuste: altura_fuste,
                   tipo_calidad_fuste: calidad,
                   especie: especie)
    end
  end
end
