class MedicionParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_inventario
  belongs_to :tipo_parcela_inventario
  has_many :arbol_inventario_estaticos
end
