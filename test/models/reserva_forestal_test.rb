# == Schema Information
#
# Table name: reserva_forestales
#
#  id                  :integer          not null, primary key
#  empresa_forestal_id :integer
#  nombre              :string(64)
#  abreviado           :string(64)
#  fecha_creacion      :date
#  fecha_reglamento    :date
#  area                :decimal(12, 2)
#  descripcion         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_reserva_forestales_on_abreviado            (abreviado) UNIQUE
#  index_reserva_forestales_on_empresa_forestal_id  (empresa_forestal_id)
#  index_reserva_forestales_on_nombre               (nombre) UNIQUE
#

require 'test_helper'

class ReservaForestalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
