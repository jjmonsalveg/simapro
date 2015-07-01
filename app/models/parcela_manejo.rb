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

class ParcelaManejo < ActiveRecord::Base
  belongs_to :bloque_manejo
  has_one :parcela_inventario
end
