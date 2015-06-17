class BloqueManejo < ActiveRecord::Base
  belongs_to :unidad_manejo
  has_many :parcela_manejos
  accepts_nested_attributes_for :parcela_manejos, reject_if: :all_blank, allow_destroy: true
end
