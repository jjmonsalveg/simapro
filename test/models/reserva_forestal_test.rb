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

require 'test_helper'

class ReservaForestalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
