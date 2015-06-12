# == Schema Information
#
# Table name: bloque_ordenacions
#
#  id                   :integer          not null, primary key
#  bloque_ordenacion_id :integer
#  nombre               :string(64)       not null
#  abreviado            :string(12)       not null
#  area                 :decimal(9, 2)    not null
#  descripcion          :text
#  unidad_ordenacion_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_bloque_ordenacions_on_bloque_ordenacion_id  (bloque_ordenacion_id) UNIQUE
#  index_bloque_ordenacions_on_unidad_ordenacion_id  (unidad_ordenacion_id)
#

class BloqueOrdenacion < ActiveRecord::Base
  belongs_to :unidad_ordenacion
  has_many :unidad_manejos

  validates :bloque_ordenacion_id, uniqueness: true
  validates :nombre, presence: true, uniqueness: true
  validates :abreviado, presence: true, uniqueness: true
  validates :area, presence: true
  # validates :unidad_ordenacion_id, presence: true

  def self.valid_cuencas
    BloqueOrdenacion.all
  end
end
