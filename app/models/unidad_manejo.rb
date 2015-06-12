class UnidadManejo < ActiveRecord::Base
  belongs_to :bloque_ordenacion
  has_many :users

  #DOCUMENTOS - NESTED ES OBLIGATORIO
  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

end
