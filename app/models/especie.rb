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
# Indexes
#
#  index_especies_on_empresa_forestal_id  (empresa_forestal_id)
#  index_especies_on_grupo_especie_id     (grupo_especie_id)
#

class Especie < ActiveRecord::Base
  belongs_to :grupo_especie
  belongs_to :empresa_forestal
  has_and_belongs_to_many :tipo_uso_especies, join_table: 'uso_especies'
  validates :nombre_comun, presence: true, uniqueness: true
  validates :grupo_especie_id, presence: true
end
