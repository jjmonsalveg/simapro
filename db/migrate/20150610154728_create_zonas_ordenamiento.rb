class CreateZonasOrdenamiento < ActiveRecord::Migration
  def change
    create_table :zonas_ordenamiento do |t|
      t.string :nombre, null:false , limit:64
      t.string :abreviado, null:false, limit:12
      t.text :ubicacion, null:false
      t.decimal :area, null:false, precision: 5
      t.string :usos , null:false , limit:64
      t.text :descripcion

      t.timestamps
    end
    add_index :zonas_ordenamiento, :nombre, unique: true
    add_index :zonas_ordenamiento, :abreviado, unique: true
  end
end
