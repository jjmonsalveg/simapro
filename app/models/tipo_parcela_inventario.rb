class TipoParcelaInventario < ActiveRecord::Base
  has_many :medicion_parcela_inventarios

  def self.tipos_aprovechamiento
    TipoParcelaInventario.where(tipo: ['Pre Aprovechamiento' ,'Post Aprovechamiento'])
  end
end
