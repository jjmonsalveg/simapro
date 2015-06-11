class CreateDivisionPoliticoTerritorial< ActiveRecord::Migration
  def change
    create_table :division_politico_territorial do |t|
      t.integer :modelo_id, null:false
      t.string :modelo_type, null:false
      t.references :municipio, null:false
      t.timestamp  null: false
    end
    add_index :division_politico_territorial, :modelo_id
    add_index :division_politico_territorial, :municipio_id
    add_index :division_politico_territorial, [:municipio_id, :modelo_id,:modelo_type],
              unique: true, name: 'moldelos_municipios_unique'
  end
end