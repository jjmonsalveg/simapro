class GrupoEspecie < ActiveRecord::Base
  has_many :especies

  validates :nombre, :codigo, presence: true
  validates_uniqueness_of :codigo
  # validates :nombre, lenght: {maximum: 32}
  # validates :codigo, lenght: {maximum: 2}

end
