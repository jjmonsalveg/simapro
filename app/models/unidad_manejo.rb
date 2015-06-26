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
#  doc_providencia      :string(255)
#  doc_plan_forestal    :string(255)
#  tipo_bosque_id       :integer
#
# Indexes
#
#  index_unidad_manejos_on_bloque_ordenacion_id  (bloque_ordenacion_id)
#  index_unidad_manejos_on_tipo_bosque_id        (tipo_bosque_id)
#  index_unidad_manejos_on_unidad_manejo_id      (unidad_manejo_id) UNIQUE
#

class UnidadManejo < ActiveRecord::Base
  belongs_to :bloque_ordenacion
  has_many :users
  has_many :division_politico_territorial, as: :modelo
  has_many :municipios, through:  :division_politico_territorial
  has_many :bloque_manejos
  belongs_to :tipo_bosque

  #DOCUMENTOS - NESTED ES OBLIGATORIO
  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

  mount_uploader :doc_providencia, DocProvidenciaUploader
  mount_uploader :doc_plan_forestal, DocProvidenciaUploader

  validates :bloque_ordenacion_id, presence: true
  validates :unidad_manejo_id, uniqueness: true #presence: true
  validates :nombre, presence: true, uniqueness: true
  validates :abreviado, presence: true, uniqueness: true
  validates :nro_providencia, presence: true
  validates :fecha_otorgacion, presence: true
  validates :area, presence: true
  validates :ubicacion, presence: true
  validates :fecha_vence, presence: true
  validates :tipo_bosque_id, presence: true

  def fecha_otorgacion_fix
    self.fecha_otorgacion.strftime("%d/%m/%Y")
  end

  def fecha_vence_fix
    self.fecha_vence.strftime("%d/%m/%Y")
  end

  def area_fix
    self.area.to_s + ' ha'
  end

  def doc_providencia_pdf?
    return true if (self.doc_providencia.url.split('.').last rescue nil) == 'pdf'
    return false
  end

  def doc_plan_forestal_pdf?
    return true if (self.doc_plan_forestal.url.split('.').last rescue nil) == 'pdf'
    return false
  end

end
