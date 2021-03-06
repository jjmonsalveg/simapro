# == Schema Information
#
# Table name: empresas_forestales
#
#  id                   :integer          not null, primary key
#  nombre               :string(255)      not null
#  abreviado            :string(255)      not null
#  rif                  :string(255)      not null
#  direccion_fiscal     :string(255)      not null
#  telefono             :string(255)      not null
#  parcela_manejo_long  :integer          default(1000), not null
#  parcela_manejo_ancho :integer          default(200), not null
#  parcela_inv_long     :integer          default(1000), not null
#  parcela_inv_ancho    :integer          default(10), not null
#  area_parcela_inv     :integer          default(10000), not null
#  cuadricula_inv_long  :integer          default(10), not null
#  cuadricula_inv_ancho :integer          default(10), not null
#  area_cuadricula_inv  :integer          default(100), not null
#  pais_id              :integer          not null
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_empresas_forestales_on_nombre    (nombre) UNIQUE
#  index_empresas_forestales_on_rif       (rif) UNIQUE
#  index_empresas_forestales_on_telefono  (telefono) UNIQUE
#

class EmpresaForestal < ActiveRecord::Base
  #configuracion/includes
  self.table_name = :empresas_forestales
  include RegexHelper

  #asociaciones
  has_many :especies
  has_many :grupo_especies, through: :especies
  belongs_to :pais
  accepts_nested_attributes_for :pais
  has_many :users
  has_many :re

  has_many :documentos,  dependent: :destroy, as: :modelo
  accepts_nested_attributes_for :documentos, allow_destroy: true
  include ModeloGeneral::ManageDocument

  #callback declaration
  # before_validation :convert_format

  #validates field
  validates :nombre,uniqueness:{message:'Otra Empresa a sido registrada con este nombre.'},
            presence: { message: 'El campo Nombre es obligatorio'},
            :length => {  maximum: 64,
                          message:
                              'Nombre debe contener máximo 64 caracteres'
            }
  validates :abreviado, uniqueness:{message:'Otra Empresa a sido registrada con este Abreviado.'},
            presence: { message: 'El campo Abreviado es obligatorio'}
  validates :rif, uniqueness:{message:'Otra Empresa a sido registrada con este RIF.'},
            presence: { message: 'El campo Rif es obligatorio'},
            format: {with:RIF_REGEX_COMPLETE,
                     message: 'El formato del campo Rif es inválido' },
            :length => {  maximum: 11,
                          message:
                              'Rif debe contener máximo 10 caracteres'
            }
  validates :direccion_fiscal, presence: { message: 'El campo Dirección es obligatorio'}
  validates :telefono ,uniqueness:{message:'Otra Empresa a sido registrada con este Teléfono.'},
            presence: {message: 'El campo Teléfono es obligatorio'}#,
            # format: {with: TELEFONO_LOCAL_REGEX, message:  'El formato del campo Teléfono es inválido'},
            # :length => {  maximum: 11,
            #               message:
            #                   'Teléfono debe contener máximo 11 caracteres'
            # }

  validates :parcela_manejo_long ,
            presence:{message: ' El campo Longitud de la Parcela de Manejo es Obligatorio'},
            numericality: { greater_than: 0,
                         message: 'El campo Longitud de la Parcela de Manejo debe ser mayor que 0' }

  validates :parcela_manejo_ancho,
            presence:{message: 'El campo Ancho de la Parcela de Manejo es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Ancho de la Parcela de Manejo debe ser mayor que 0' }

  validates :parcela_inv_long,
            presence:{message: ' El campo Longitud de la Parcela de Inventario es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Longitud de la Parcela de Inventario  debe ser mayor que 0' }

  validates :parcela_inv_ancho,
            presence:{message: ' El campo Ancho de la parcela de inventario  es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Ancho de la Parcela de Inventario debe ser mayor que 0' }

  validates :area_parcela_inv,
            presence:{message: ' El campo Area de la parcela de inventario  es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Area de la Parcela de Inventario debe ser mayor que 0' }

  validates :cuadricula_inv_ancho,
            presence:{message: ' El campo Ancho de la Cuadrícula de Inventario es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Ancho de la Cuadrícula de Inventario debe ser mayor que 0' }

  validates :cuadricula_inv_long, presence:{message: ' El campo Longitud de la Cuadrícula de Inventario es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Longitud de la Parcela de Manejo debe ser mayor que 0' }

  validates :area_cuadricula_inv, presence:{message: ' El campo Area de la cuadrícula de inventario es Obligatorio'},
            numericality: { greater_than: 0, message: 'El campo Area de la cuadrícula de inventario debe ser mayor que 0' }



  #callbacks definition
  def convert_format
    self.rif= self.rif.gsub(/-/,'')
    self.telefono = self.telefono.gsub(/[\(\)\- ]/,'')
  end
  #helps methods

  def self.forestales_without_admin
    return EmpresaForestal.where.not(id: EmpresaForestal.joins(:users).merge(User.joins(:role).where(roles: {role_type: Role.role_types[:administrador_cliente]})))
  end

  def safe_to_delete
    if self.users.any? || self.reservas_forestales.any?
      return false
    else
      return true
    end
  end
end
