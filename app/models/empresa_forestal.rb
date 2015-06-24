# == Schema Information
#
# Table name: empresas_forestales
#
#  id               :integer          not null, primary key
#  nombre           :string(255)      not null
#  abreviado        :string(255)      not null
#  rif              :string(255)      not null
#  direccion_fiscal :string(255)      not null
#  telefono         :string(255)      not null
#  pais_id          :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class EmpresaForestal < ActiveRecord::Base
  #configuracion/includes
  self.table_name = :empresas_forestales
  include RegexHelper

  #asociaciones
  belongs_to :pais
  accepts_nested_attributes_for :pais
  has_many :users
  has_many :re

  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

  #callback declaration
  before_validation :convert_format

  #validates field
  validates :nombre,uniqueness:{message:'Otra Empresa a sido registrada con este nombre.'},
            presence: { message: 'El campo Nombre es obligatorio'}
  validates :abreviado, uniqueness:{message:'Otra Empresa a sido registrada con este Abreviado.'},
            presence: { message: 'El campo Abreviado es obligatorio'}
  validates :rif, uniqueness:{message:'Otra Empresa a sido registrada con este RIF.'},
            presence: { message: 'El campo Rif es obligatorio'},
            # format: {with:RIF_REGEX_COMPLETE,
            #          message: 'El formato del campo Rif es inválido' },
            :length => {  maximum: 10,
                          message:
                              'Rif debe contener máximo 10 caracteres'
            }
  validates :direccion_fiscal, presence: { message: 'El campo Dirección es obligatorio'}
  validates :telefono ,uniqueness:{message:'Otra Empresa a sido registrada con este Teléfono.'},
            presence: {message: 'El campo Teléfono es obligatorio'},
      # format: {with: TELEFONO_LOCAL_REGEX, message:  'El formato del campo Teléfono es inválido'},
      :length => {  maximum: 11,
                    message:
                        'Teléfono debe contener máximo 11 caracteres'
      }

  #callbacks definition
  def convert_format
    self.rif= self.rif.gsub(/-/,'')
    self.telefono = self.telefono.gsub(/[\(\)\- ]/,'')
  end
  #helps methods

  def self.forestales_without_admin
    return EmpresaForestal.where.not(id: EmpresaForestal.joins(:users).merge(User.joins(:role).where(roles: {role_type: Role.role_types[:administrador_cliente]})))
  end
end
