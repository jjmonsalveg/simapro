class MasaForestal

  def self.get_masa_forestal(tipo_inventario_id, parcela_id, tipo_criterio, especificacion_diametrica_val)
    aies = MedicionParcelaInventario.find_by(parcela_inventario_id: parcela_id, tipo_parcela_inventario_id: tipo_inventario_id).arbol_inventario_estaticos.where("dap >= ?", especificacion_diametrica_val)
    if tipo_criterio == "especie"
      return MasaForestal.get_masa_x_especie(aies, parcela_id)
    else
      if tipo_criterio == "grupo_especie"
        return MasaForestal.get_masa_x_grupo_especie(aies,parcela_id)
      else
        return MasaForestal.get_masa_x_calidad(aies,parcela_id)
      end
    end

  end

  def self.get_masa_x_especie(aies, parcela_id)
    result = Array.new
    p aies.select('DISTINCT especie_id').inspect
    aies.select('DISTINCT especie_id').each do |especie|
      val = Array.new
      val[0]  = Especie.find(especie.especie_id).nombre_comun
      aies_especie = aies.where(especie_id: especie.especie_id)
      val[1] = (aies_especie.count(:id)/ParcelaInventario.find(parcela_id).parcela_manejo.area)
      val[2] = aies_especie.sum(:area_basal)
      val[3] = aies_especie.sum(:volumen)
      val[4] = aies_especie.count(:nro_cuadricula)
      result.append(val)
    end
    return result
  end

  def self.get_masa_x_grupo_especie(aies, parcela_id)
    result = Array.new
    Especie.where(id: aies.pluck('DISTINCT especie_id')).pluck("distinct grupo_especie_id").each do |grupo_especie|
      val = Array.new
      ge = GrupoEspecie.find(grupo_especie)
      val[0]  = ge.nombre
      aies_g_especie = aies.where(especie_id: ge.especies.pluck(:id))
      val[1] = (aies_g_especie.count(:id)/ParcelaInventario.find(parcela_id).parcela_manejo.area)
      val[2] = aies_g_especie.sum(:area_basal)
      val[3] = aies_g_especie.sum(:volumen)
      val[4] = aies_g_especie.count(:nro_cuadricula)
      result.append(val)
    end
    return result
  end

  def self.get_masa_x_calidad(aies, parcela_id)
    result = Array.new
    aies.select('DISTINCT tipo_calidad_fuste').each do |calidad|
      val = Array.new
      val[0]  = calidad.tipo_calidad_fuste
      aies_especie = aies.where(tipo_calidad_fuste: ArbolInventarioEstatico.tipo_calidad_fustes[calidad.tipo_calidad_fuste])
      val[1] = (aies_especie.count(:id)/ParcelaInventario.find(parcela_id).parcela_manejo.area)
      val[2] = aies_especie.sum(:area_basal)
      val[3] = aies_especie.sum(:volumen)
      val[4] = aies_especie.count(:nro_cuadricula)
      result.append(val)
    end
    return result
  end

end
