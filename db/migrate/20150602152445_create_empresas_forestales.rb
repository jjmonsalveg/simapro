class CreateEmpresasForestales < ActiveRecord::Migration
  def change
    create_table :empresas_forestales do |t|
      t.string :nombre, null: false
      t.string :abreviado, null:false
      t.string :rif, null: false
      t.string :direccion_fiscal, null:false
      t.string :telefono, null:false
      t.references :pais, null: false

      t.timestamps
    end

    add_index :empresas_forestales, :nombre, unique: true
    add_index :empresas_forestales, :rif, unique: true
    add_index :empresas_forestales, :telefono, unique: true
  end
end
