# == Schema Information
#
# Table name: pais
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  idioma_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_pais_on_idioma_id  (idioma_id)
#

class Pais < ActiveRecord::Base
  # has_many :malls
  belongs_to :idioma
  validates :nombre, presence: true
  validates :nombre, uniqueness: true
end
