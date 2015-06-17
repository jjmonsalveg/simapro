class TipoBosque < ActiveRecord::Base

  def nombre_h
    self.nombre.capitalize.humanize
  end
end
