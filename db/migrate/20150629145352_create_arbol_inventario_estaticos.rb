class CreateArbolInventarioEstaticos < ActiveRecord::Migration
  def change
    create_table :arbol_inventario_estaticos do |t|
      t.integer :nro_cuadricula
      t.integer :nro_arbol
      t.integer :bi
      t.integer :tipo_fisiografia, default: 0
      t.integer :tipo_calidad_fuste, default: 0
      t.decimal :dap
      t.decimal :altura_fuste
      t.references :especie, index: true
      t.references :medicion_parcela_inventario

      t.timestamps
    end

    add_index :arbol_inventario_estaticos, :medicion_parcela_inventario_id, name: 'medicion_parcela_inventario_id_index'
  end
end
