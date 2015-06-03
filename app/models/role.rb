class Role < ActiveRecord::Base
  has_many :users

  has_and_belongs_to_many :permissions

  validates :name, presence: true

  enum role_type: [:administrador_sistema, :administrador_cliente, :cliente_mall, :cliente_tienda]

  def self.all_valids
    Role.where.not(role_type: Role.role_types[:administrador_sistema])
  end

  def self.administrador_sistemas
    Role.where(role_type: Role.role_types[:administrador_cliente])
  end

  def self.cliente_malls
    Role.where(role_type: Role.role_types[:cliente_mall])
  end

  def self.cliente_tiendas
    Role.where(role_type: Role.role_types[:cliente_tienda])
  end

  def name_type
    self.name + ' - ' + self.role_type_humanized
  end

  def role_type_humanized
    self.role_type.humanize.titleize
  end

  def self.valid_role_types
    %w[administrador_cliente cliente_mall cliente_tienda]
  end

end