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

class BloqueManejo < ActiveRecord::Base
  belongs_to :unidad_manejo
  has_many :parcela_manejos
  accepts_nested_attributes_for :parcela_manejos, reject_if: :all_blank, allow_destroy: true

  validates :codigo, presence: true
  validates :area, presence: true

end
