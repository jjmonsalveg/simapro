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
