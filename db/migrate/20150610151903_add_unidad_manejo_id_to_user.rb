class AddUnidadManejoIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :unidad_manejo, index: true
  end
end
