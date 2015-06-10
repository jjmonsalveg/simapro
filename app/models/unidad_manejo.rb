class UnidadManejo < ActiveRecord::Base
  belongs_to :bloque_ordenacion
  has_many :users
end
