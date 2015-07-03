class CreateUnidadOrdenaciones < ActiveRecord::Migration
  def change
    create_table :unidad_ordenaciones do |t|
      t.references :reserva_forestal, index: true
      t.string :codigo, limit: 3
      t.string :nro_contrato, limit: 16
      t.date :fecha_otorgamiento
      t.date :fecha_vencimiento
      t.decimal :area, precision: 12, scale: 2
      t.string :descripcion

      t.timestamps
    end
    add_index :unidad_ordenaciones, :codigo, unique: true
  end
end
