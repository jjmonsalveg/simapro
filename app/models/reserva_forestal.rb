# == Schema Information
#
# Table name: reserva_forestales
#
#  id                  :integer          not null, primary key
#  empresa_forestal_id :integer
#  nombre              :string(64)
#  abreviado           :string(64)
#  fecha_creacion      :date
#  fecha_reglamento    :date
#  area                :decimal(12, 2)
#  descripcion         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_reserva_forestales_on_abreviado            (abreviado) UNIQUE
#  index_reserva_forestales_on_empresa_forestal_id  (empresa_forestal_id)
#  index_reserva_forestales_on_nombre               (nombre) UNIQUE
#

class ReservaForestal < ActiveRecord::Base
  belongs_to :empresa_forestal

  validates :nombre,uniqueness:{message:'Otra Reserva Forestal a sido registrada con este nombre.'},
            presence: { message: 'El campo Nombre es obligatorio'},
            length: {maximum: 64, message: 'El campo Nombre debe contener máximo 64 caracteres'}
  validates :abreviado, uniqueness:{message:'Otra Reserva Forestal a sido registrada con este Abreviado.'},
            presence: { message: 'El campo Abreviado es obligatorio'},
            length: {maximum: 12, message: 'El campo Abreviado debe contener máximo 12 caracteres'}

  validate :fecha_creacion_actual?
  validate :fecha_reglamento_actual?




  def fecha_creacion_actual?
    if self.fecha_creacion >= Date.today
      errors.add(:fecha_creacion, 'La Fecha de creación debe ser anterior a la fecha actual')
    end
  end

  def fecha_reglamento_actual?
    if self.fecha_reglamento >= Date.today
      errors.add(:fecha_reglamento, 'La Fecha Reglamento de Uso debe ser anterior a la fecha actual')
    end
  end
end
