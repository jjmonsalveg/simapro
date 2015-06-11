# == Schema Information
#
# Table name: zonas_ordenamiento
#
#  id          :integer          not null, primary key
#  nombre      :string(64)       not null
#  abreviado   :string(12)       not null
#  ubicacion   :text             not null
#  area        :integer          not null
#  usos        :string(64)       not null
#  descripcion :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_zonas_ordenamiento_on_abreviado  (abreviado) UNIQUE
#  index_zonas_ordenamiento_on_nombre     (nombre) UNIQUE
#

class ZonaOrdenamiento < ActiveRecord::Base
  #configuracion/includes
  #asociaciones
  has_many :division_politico_territorial, as: :modelo
  has_many :municipios, through:  :division_politico_territorial
  #callback declaration
  before_save :validar_area

  #validates field
  validates :nombre, presence: { message: 'El campo Nombre es obligatorio'},
            uniqueness: {message: 'El campo Nombre ha sido Tomado por otra Zona de Ordenamiento'},
            :length => {  maximum: 64,
                          message:
                              'Nombre debe contener máximo 64 caracteres'
            }
  validates :abreviado, presence: { message: 'El campo Abreviado es obligatorio'},
            uniqueness: {message: 'El campo Abreviado ha sido Tomado por otra Zona de Ordenamiento'},
            :length => {  maximum: 12,
                          message:
                              'Abreviado debe contener máximo 12 caracteres'
            }
  validates :ubicacion, presence: { message: 'El campo Ubicación es obligatorio'}
  validates :area, presence: { message: 'El campo Area es obligatorio'}
  validates :usos, presence: { message: 'El campo Usos es obligatorio'},
            :length => {  maximum: 64,
                          message:
                              'Usos debe contener máximo 64 caracteres'
            }
  #callbacks definition
  def validar_area
    self.errors.add(:area, 'Area debe ser mayor a 0')
  end
  #helps methods


end