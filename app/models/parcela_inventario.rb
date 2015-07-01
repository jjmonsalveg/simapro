class ParcelaInventario < ActiveRecord::Base
  belongs_to :parcela_manejo
  has_many :medicion_parcela_inventarios
end
