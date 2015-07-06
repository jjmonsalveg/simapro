class MedicionParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_inventario
  belongs_to :tipo_parcela_inventario

  has_many :arbol_inventario_estaticos
  accepts_nested_attributes_for :arbol_inventario_estaticos , reject_if: :all_blank, allow_destroy: true
end
