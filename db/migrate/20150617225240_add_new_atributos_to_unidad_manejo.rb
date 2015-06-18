class AddNewAtributosToUnidadManejo < ActiveRecord::Migration
  def change
    add_column :unidad_manejos, :doc_plan_forestal, :string
    add_reference :unidad_manejos, :tipo_bosque, index: true
  end
end
