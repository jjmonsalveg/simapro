class AddUnidadOrdenacionRefToZonasOrdenacion < ActiveRecord::Migration
  def change
    add_reference :zonas_ordenamiento, :unidad_ordenacion, index:true
  end
end
