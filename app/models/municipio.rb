# == Schema Information
#
# Table name: municipios
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  estado_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Municipio < ActiveRecord::Base
  #asociaciones
  belongs_to :estado
  has_many :division_politico_territorial

  #CADA UNO  DEBE HACERLO
  has_many :zonas_ordenamiento , through: :division_politico_territorial ,
           source: :modelo, source_type: "ZonaOrdenamiento"
end
