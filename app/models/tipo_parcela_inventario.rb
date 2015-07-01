class TipoParcelaInventario < ActiveRecord::Base
  has_many :medicion_parcela_inventarios
end
