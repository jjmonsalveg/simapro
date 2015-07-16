class CreateTablaVolumenes < ActiveRecord::Migration
  def change
    create_table :tabla_volumenes do |t|
      t.integer :dap
      t.integer :altura
      t.decimal :volumen, scale: 2, precision: 12
      t.references :tipo_bosque, index: true

      t.timestamps
    end
  end
end
