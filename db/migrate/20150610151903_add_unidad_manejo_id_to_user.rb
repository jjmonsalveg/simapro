class AddUnidadManejoIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :unidad_manejo_id, index: true
  end
end
