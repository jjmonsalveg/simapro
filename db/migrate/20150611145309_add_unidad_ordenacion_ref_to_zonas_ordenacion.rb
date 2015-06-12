class AddUnidadOrdenacionRefToZonasOrdenacion < ActiveRecord::Migration
  def change
    #TODO que sea obligatoria
    add_reference :zonas_ordenamiento, :unidad_ordenacion, index:true
  end
end
