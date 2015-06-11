# == Schema Information
#
# Table name: bloque_manejos
#
#  id               :integer          not null, primary key
#  bloque_manejo_id :integer
#  codigo           :string(255)
#  area             :decimal(, )
#  unidad_manejo_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_bloque_manejos_on_unidad_manejo_id  (unidad_manejo_id)
#

class BloqueManejo < ActiveRecord::Base
  belongs_to :unidad_manejo
end
