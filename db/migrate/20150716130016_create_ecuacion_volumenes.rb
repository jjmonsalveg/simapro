class CreateEcuacionVolumenes < ActiveRecord::Migration
  def change
    create_table :ecuacion_volumenes do |t|
      t.decimal :dap_inicial
      t.decimal :dap_final
      t.string :ecuacion_volumen
      t.references :tipo_bosque, index: true
      t.timestamps
    end
  end
end
