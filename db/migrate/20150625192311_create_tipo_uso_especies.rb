class CreateTipoUsoEspecies < ActiveRecord::Migration
  def change
    create_table :tipo_uso_especies do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
