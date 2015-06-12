# == Schema Information
#
# Table name: unidad_manejos
#
#  id                   :integer          not null, primary key
#  unidad_manejo_id     :integer
#  nombre               :string(64)       not null
#  abreviado            :string(12)       not null
#  nro_providencia      :string(12)       not null
#  fecha_otorgacion     :date
#  fecha_vence          :date
#  area                 :decimal(9, 2)
#  ubicacion            :text
#  descripcion          :text
#  bloque_ordenacion_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_unidad_manejos_on_bloque_ordenacion_id  (bloque_ordenacion_id)
#  index_unidad_manejos_on_unidad_manejo_id      (unidad_manejo_id) UNIQUE
#

class UnidadManejo < ActiveRecord::Base
  belongs_to :bloque_ordenacion
  has_many :users

  #DOCUMENTOS - NESTED ES OBLIGATORIO
  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

end
