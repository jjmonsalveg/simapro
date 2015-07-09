class AddVolumenAreaBasalToArbolInventarioEstatico < ActiveRecord::Migration
  def change
    add_column :arbol_inventario_estaticos, :volumen, :decimal, scale: 3, precision: 12
    add_column :arbol_inventario_estaticos,  :area_basal, :decimal, scale: 3, precision: 12
  end
end
