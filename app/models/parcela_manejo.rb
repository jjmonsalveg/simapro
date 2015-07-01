# == Schema Information
#
# Table name: parcela_manejos
#
#  id                :integer          not null, primary key
#  parcela_manejo_id :integer
#  codigo            :string(2)
#  area              :decimal(5, 2)    default(20.0)
#  bloque_manejo_id  :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_parcela_manejos_on_bloque_manejo_id   (bloque_manejo_id)
#  index_parcela_manejos_on_parcela_manejo_id  (parcela_manejo_id) UNIQUE
#

class ParcelaManejo < ActiveRecord::Base
  belongs_to :bloque_manejo
  has_one :parcela_inventario
end
