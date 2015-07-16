class CreateTablaAlturas < ActiveRecord::Migration
  def change
    create_table :tabla_alturas do |t|
      t.integer :dap
      t.integer :altura
      t.references :tipo_bosque, index: true

      t.timestamps
    end
  end
end
