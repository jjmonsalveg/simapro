class CreateMedicionParcelaInventarios < ActiveRecord::Migration
  def change
    create_table :medicion_parcela_inventarios do |t|
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.boolean :medicion_dap
      t.string :tecnico
      t.string :baquiano
      t.references :parcela_inventario, index: true
      t.references :tipo_parcela_inventario

      t.timestamps
    end
    add_index :medicion_parcela_inventarios, :tipo_parcela_inventario_id, name: 'tipo_parcela_inventario_id_index'
  end
end
