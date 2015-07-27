class MedicionParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_inventario
  belongs_to :tipo_parcela_inventario

  has_many :arbol_inventario_estaticos
  accepts_nested_attributes_for :arbol_inventario_estaticos , reject_if: :all_blank, allow_destroy: true


  def create_or_update_arbol(nro_cuadricula, fi, nro_arbol, bi, especie, dap_cap, altura_fuste, calidad, empresa_forestal_id)
    if nro_arbol.present? && bi.present?
      arbol = self.arbol_inventario_estaticos.find_by(nro_arbol: nro_arbol, bi: bi)
      especie = Especie.find_by(nombre_comun: especie, empresa_forestal_id: empresa_forestal_id) ||
                Especie.create(nombre_comun: especie, empresa_forestal_id: empresa_forestal_id)
      dap = self.medicion_dap ? dap_cap.to_f.round(2) : (dap_cap.to_f / Math::PI).round(2)
      area_basal = ((Math::PI / 4) * (dap.to_f) * (dap.to_f)).round(2)
      eq_volumen = '0'
      eq_volumen = EcuacionVolumen.where("dap_inicial <= ? AND dap_final >= ?", dap, dap).first.ecuacion_volumen if dap.present?
      volumen = Dentaku(eq_volumen, d: dap.to_f, h: altura_fuste.to_f)
      if arbol.nil?
        self.arbol_inventario_estaticos.create(nro_cuadricula: nro_cuadricula,
                                               tipo_fisiografia: fi,
                                               nro_arbol: nro_arbol,
                                               bi: bi,
                                               dap: dap,
                                               altura_fuste: altura_fuste,
                                               tipo_calidad_fuste: calidad,
                                               especie_id: especie.id,
                                               volumen: volumen,
                                               area_basal: area_basal)
      else
        arbol.update(nro_cuadricula: nro_cuadricula,
                     tipo_fisiografia: fi,
                     dap: dap,
                     altura_fuste: altura_fuste,
                     tipo_calidad_fuste: calidad,
                     especie_id: especie.id,
                     volumen: volumen,
                     area_basal: area_basal)
      end
    else
      return false
    end
  end

  def tecnico_fecha
    self.tecnico + ' ' + self.fecha_inicio.strftime("%d/%m/%y")
  end

end
