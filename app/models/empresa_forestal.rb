# == Schema Information
#
# Table name: empresas_forestales
#
#  id               :integer          not null, primary key
#  nombre           :string(255)
#  abreviado        :string(255)
#  rif              :string(255)
#  direccion_fiscal :string(255)
#  telefono         :string(255)
#  pais_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_empresas_forestales_on_nombre    (nombre) UNIQUE
#  index_empresas_forestales_on_rif       (rif) UNIQUE
#  index_empresas_forestales_on_telefono  (telefono) UNIQUE
#

class EmpresaForestal < ActiveRecord::Base
  self.table_name = :empresas_forestales
  belongs_to :pais
  accepts_nested_attributes_for :pais
end
