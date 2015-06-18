class CreateBloqueManejos < ActiveRecord::Migration
  def change
    create_table :bloque_manejos do |t|
      t.string :codigo
      t.decimal :area
      t.references :unidad_manejo, index: true

      t.timestamps
    end
  end
end