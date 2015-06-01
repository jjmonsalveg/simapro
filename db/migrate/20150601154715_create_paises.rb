class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nombre
      t.references :idioma, index: true
      t.timestamps
    end
  end
end
