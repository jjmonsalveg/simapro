# == Schema Information
#
# Table name: division_politico_territorial
#
#  id           :integer          not null, primary key
#  modelo_id    :integer          not null
#  modelo_type  :string(255)      not null
#  municipio_id :integer          not null
#
# Indexes
#
#  index_division_politico_territorial_on_modelo_id     (modelo_id)
#  index_division_politico_territorial_on_municipio_id  (municipio_id)
#  moldelos_municipios_unique                           (municipio_id,modelo_id,modelo_type) UNIQUE
#

class DivisionPoliticoTerritorial < ActiveRecord::Base
  #configuracion/includes
  self.pluralize_table_names = false

  #asociaciones
  belongs_to :modelo, polymorphic: true
  belongs_to :municipio
end
