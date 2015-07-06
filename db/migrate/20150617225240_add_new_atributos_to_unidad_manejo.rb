class AddNewAtributosToUnidadManejo < ActiveRecord::Migration
  def change
    add_reference :unidad_manejos, :tipo_bosque, index: true
  end
end
