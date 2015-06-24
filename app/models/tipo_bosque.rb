# == Schema Information
#
# Table name: tipo_bosques
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TipoBosque < ActiveRecord::Base
  has_many :unidad_manejos

  def nombre_h
    self.nombre.capitalize.humanize
  end
end
