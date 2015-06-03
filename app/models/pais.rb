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
# Indexes
#
#  index_paises_on_idioma_id  (idioma_id)
#

class Pais < ActiveRecord::Base
  belongs_to :idioma
  validates :nombre, presence: {message: 'Debe ingresar nombre de Pais'},
             uniqueness:{message: 'País ya ha sido creado'}
end