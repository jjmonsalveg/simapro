# == Schema Information
#
# Table name: grupo_especies
#
#  id         :integer          not null, primary key
#  nombre     :string(32)       not null
#  codigo     :string(2)        not null
#  created_at :datetime
#  updated_at :datetime
#

class GrupoEspecie < ActiveRecord::Base
  has_many :especies

  validates :nombre, :codigo, presence: true
  validates_uniqueness_of :codigo
  # validates :nombre, lenght: {maximum: 32}
  # validates :codigo, lenght: {maximum: 2}

end
