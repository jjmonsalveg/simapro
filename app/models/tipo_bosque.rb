class TipoBosque < ActiveRecord::Base
  has_many :unidad_manejos

  def nombre_h
    self.nombre.capitalize.humanize
  end
end
