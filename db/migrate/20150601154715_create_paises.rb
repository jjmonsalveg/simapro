class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nombre, limit:64
      t.references :idioma, index: true
      t.timestamps
    end
  end
end
