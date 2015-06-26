# == Schema Information
#
# Table name: tipo_uso_especies
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TipoUsoEspecie < ActiveRecord::Base
  has_and_belongs_to_many :especies, join_table: 'uso_especies'

end
