class ParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_manejo

  has_many :medicion_parcela_inventarios
  has_many :arbol_inventario_estaticos, through: :medicion_parcela_inventarios
  accepts_nested_attributes_for :medicion_parcela_inventarios, :arbol_inventario_estaticos , reject_if: :all_blank, allow_destroy: true

  validates :parcela_manejo_id, presence: true, uniqueness: true
end
