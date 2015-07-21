class ArbolInventarioEstatico < ActiveRecord::Base
  belongs_to :especie
  belongs_to :medicion_parcela_inventario

  enum tipo_fisiografia: [:Ba, :La, :Ca]
  enum tipo_calidad_fuste: [:B, :R, :M]
end
