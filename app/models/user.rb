# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  unique_session_id      :string(20)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :recoverable,
          :rememberable, :trackable, :validatable, :session_limitable

  devise :database_authenticatable,:authentication_keys => [:username]

  mount_uploader :avatar, AvatarUploader

  belongs_to :role
  belongs_to :empresa_forestal

  validates :username, presence: {message: 'es obligatorio'},
            uniqueness: {message: 'ya en uso.'}
  validates :email, presence: {message: 'Email Obligatorio'}
  validates :name, presence: {message: 'Nombre Obligatorio'}
  validates :role_id, presence: {message: 'Rol Obligatorio'}
  validate :admin

  def admin
    if Role.find_by(id: role_id) != Role.find(1)
      if mall_id.nil?
        errors.add(:mall_id, "Debe asignar un mall al usuario")
      end
    end
  end

  def self.forestal_admins
    User.joins(:role).where(roles: {role_type: Role.role_types[:administrador_cliente]})
  end
end
