class ArbolInventarioEstatico < ActiveRecord::Base
  belongs_to :especie
  belongs_to :medicio_parcela_inventario

  enum tipo_fisiografia: [:B, :L, :C]
  enum tipo_calidad_fuste: [:B, :R, :M]
end
