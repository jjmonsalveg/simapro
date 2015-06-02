class CreateEmpresasForestales < ActiveRecord::Migration
  def change
    create_table :empresas_forestales do |t|
      t.string :nombre
      t.string :abreviado
      t.string :rif
      t.string :direccion_fiscal
      t.string :telefono
      t.references :pais

      t.timestamps
    end

    add_index :empresas_forestales, :nombre, unique: true
    add_index :empresas_forestales, :rif, unique: true
    add_index :empresas_forestales, :telefono, unique: true
  end
end
