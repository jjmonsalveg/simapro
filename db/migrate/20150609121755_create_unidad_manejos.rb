class CreateUnidadManejos < ActiveRecord::Migration
  def change
    create_table :unidad_manejos do |t|
      # t.integer :unidad_manejo_id
      t.string :nombre, null: false, limit: 64
      t.string :abreviado, null:false, limit: 12
      t.string :nro_providencia, null:false, limit: 12
      t.date :fecha_otorgamiento
      t.date :fecha_vencimiento
      t.decimal :area, scale: 2
      t.text :ubicacion
      t.text :descripcion
      t.references :bloque_ordenacion, index: true

      t.timestamps
    end
  end
end
