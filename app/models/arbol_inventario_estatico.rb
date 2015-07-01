class ArbolInventarioEstatico < ActiveRecord::Base
  belongs_to :especie
  belongs_to :medicio_parcela_inventario

  enum tipo_fisiografia: [:base, :ladera, :cima]
  enum tipo_calidad_fuste: [:buena, :regular, :mala]
end
