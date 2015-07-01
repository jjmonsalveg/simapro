class CreateParcelaInventarios < ActiveRecord::Migration
  def change
    create_table :parcela_inventarios do |t|
      t.integer :coord_norte_utm
      t.integer :coord_este_utm
      t.string :azimut
      t.references :parcela_manejo, index: true

      t.timestamps
    end
  end
end
