# == Schema Information
#
# Table name: unidad_ordenaciones
#
#  id                  :integer          not null, primary key
#  reserva_forestal_id :integer
#  codigo              :string(3)
#  nro_contrato        :string(16)
#  fecha_otorgacion    :date
#  fecha_vence         :date
#  area                :decimal(12, 2)
#  descripcion         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_unidad_ordenaciones_on_codigo               (codigo) UNIQUE
#  index_unidad_ordenaciones_on_reserva_forestal_id  (reserva_forestal_id)
#

class UnidadOrdenacion < ActiveRecord::Base
  belongs_to :reserva_forestal
  has_many :zona_ordenamientos, dependent: :destroy

  #asociaciones
  has_many :division_politico_territorial, as: :modelo
  has_many :municipios, through:  :division_politico_territorial
  has_many :bloque_ordenacions

  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

  def self.unidades_empresa(empresa_id)
    UnidadOrdenacion.joins(:reserva_forestal).where(reserva_forestales: {empresa_forestal_id: empresa_id})
  end

  def text_for_select
    codigo + ', '+ reserva_forestal.nombre
  end

  def safe_to_delete
    return (self.bloque_ordenacions.any? || self.zona_ordenamientos.any?) ? false : true
  end
end
