# == Schema Information
#
# Table name: especies
#
#  id                  :integer          not null, primary key
#  nombre_comun        :string(255)
#  nombre_cientifico   :string(255)
#  sinonimia           :string(255)
#  familia             :string(255)
#  dmc                 :integer
#  densidad            :decimal(, )
#  grupo_especie_id    :integer
#  empresa_forestal_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Especie < ActiveRecord::Base
  belongs_to :grupo_especie
  belongs_to :empresa_forestal

  validates :nombre_comun, presence: true, uniqueness: true
end
