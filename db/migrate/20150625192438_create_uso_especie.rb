class CreateUsoEspecie < ActiveRecord::Migration
  def change
    create_table :uso_especies do |t|
      t.references :especie, index:true
      t.references :tipo_uso_especie, index:true
    end
  end
end
