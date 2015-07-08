class CreateParcelaManejos < ActiveRecord::Migration
  def change
    create_table :parcela_manejos do |t|
      t.integer :parcela_manejo_id
      t.string :codigo, limit: 2
      t.decimal :area, scale: 2, default: 20
      t.references :bloque_manejo, index: true

      t.timestamps
    end
    add_index :parcela_manejos, :parcela_manejo_id, unique: true
  end
end
