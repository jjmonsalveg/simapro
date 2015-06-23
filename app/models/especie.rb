class Especie < ActiveRecord::Base
  belongs_to :grupo_especie
  belongs_to :empresa_forestal
end
