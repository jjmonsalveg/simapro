class CreateTipoParcelaInventarios < ActiveRecord::Migration
  def change
    create_table :tipo_parcela_inventarios do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
