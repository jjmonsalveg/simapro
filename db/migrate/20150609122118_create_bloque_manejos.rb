class CreateBloqueManejos < ActiveRecord::Migration
  def change
    create_table :bloque_manejos do |t|
      t.integer :bloque_manejo_id
      t.string :codigo
      t.decimal :area
      t.references :unidad_manejo, index: true

      t.timestamps
    end
  end
end
