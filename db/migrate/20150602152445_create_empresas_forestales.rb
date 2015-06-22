class CreateEmpresasForestales < ActiveRecord::Migration
  def change
    create_table :empresas_forestales do |t|

      t.string :nombre, null: false
      t.string :abreviado, null:false
      t.string :rif, null: false
      t.string :direccion_fiscal, null:false
      t.string :telefono, null:false

      t.integer :parcela_manejo_long  , default: 1000 , null:false
      t.integer :parcela_manejo_ancho , default: 200  , null:false
      t.integer :parcela_inv_long     , default: 1000 , null:false
      t.integer :parcela_inv_ancho    , default: 10   , null:false
      t.integer :area_parcela_inv     , default: 10000, null:false
      t.integer :cuadricula_inv_long  , default: 10   , null:false
      t.integer :cuadricula_inv_ancho , default: 10   , null:false
      t.integer :area_cuadricula_inv  , default: 100   , null:false

      t.references :pais, null: false

      t.timestamps
    end

    add_index :empresas_forestales, :nombre, unique: true
    add_index :empresas_forestales, :rif, unique: true
    add_index :empresas_forestales, :telefono, unique: true
  end
end
