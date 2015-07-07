class CreateEspecies < ActiveRecord::Migration
  def change
    create_table :especies do |t|
      t.string :nombre_comun
      t.string :nombre_cientifico
      t.string :sinonimia
      t.string :familia
      t.integer :dmc, default: 40
      t.decimal :densidad, precision: 9, scale: 2
      t.references :grupo_especie, index: true
      t.references :empresa_forestal, index: true

      t.timestamps
    end
  end
end
