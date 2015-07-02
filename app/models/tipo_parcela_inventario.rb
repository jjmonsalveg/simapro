class TipoParcelaInventario < ActiveRecord::Base
  has_many :medicion_parcela_inventarios

  def tipo_human
    self.tipo.humanize.capitalize
  end
end
