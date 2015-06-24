# == Schema Information
#
# Table name: paises
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  idioma_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Pais < ActiveRecord::Base
  belongs_to :idioma
  has_many :empresas_forestales
  validates :nombre, presence: {message: 'Debe ingresar nombre de Pais'},
             uniqueness:{message: 'País ya ha sido creado'}
end
