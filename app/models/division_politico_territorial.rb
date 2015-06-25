# == Schema Information
#
# Table name: division_politico_territorial
#
#  id           :integer          not null, primary key
#  modelo_id    :integer          not null
#  modelo_type  :string(255)      not null
#  municipio_id :integer          not null
#

class DivisionPoliticoTerritorial < ActiveRecord::Base
  #configuracion/includes
  self.pluralize_table_names = false

  #asociaciones
  belongs_to :modelo, polymorphic: true
  belongs_to :municipio
end
