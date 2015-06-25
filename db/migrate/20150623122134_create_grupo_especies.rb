class CreateGrupoEspecies < ActiveRecord::Migration
  def change
    create_table :grupo_especies do |t|
      t.string :nombre, null:false, limit: 32
      t.string :codigo, null:false, limit: 2

      t.timestamps
    end
  end
end
