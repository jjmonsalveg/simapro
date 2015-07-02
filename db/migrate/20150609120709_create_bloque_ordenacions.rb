class CreateBloqueOrdenacions < ActiveRecord::Migration
  def change
    create_table :bloque_ordenacions do |t|
      # t.integer :bloque_ordenacion_id
      t.string :nombre, null: false, limit: 64, unique: true
      t.string :abreviado, null: false, limit: 12, unique: true
      t.decimal :area, precision: 9, scale: 2, null: false
      t.text :descripcion
      t.references :unidad_ordenacion, index: true

      t.timestamps
    end
  end
end
