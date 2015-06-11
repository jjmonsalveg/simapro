class CreateReservaForestales < ActiveRecord::Migration
  def change
    create_table :reserva_forestales do |t|
      t.references :empresa_forestal, index: true
      t.string :nombre, limit: 64
      t.string :abreviado, limit: 64
      t.date :fecha_creacion
      t.date :fecha_reglamento
      t.decimal :area, precision: 12, scale: 2
      t.string :descripcion

      t.timestamps
    end
    add_index :reserva_forestales, :nombre, unique: true
    add_index :reserva_forestales, :abreviado, unique: true
  end
end
