# == Schema Information
#
# Table name: bloque_manejos
#
#  id               :integer          not null, primary key
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
  has_many :parcela_manejos
  accepts_nested_attributes_for :parcela_manejos, reject_if: :all_blank, allow_destroy: true

  validates :codigo, presence: true
  validates :area, presence: true

end
