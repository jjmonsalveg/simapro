class AddDocProvidenciaToUnidadManejo < ActiveRecord::Migration
  def change
    add_column :unidad_manejos, :doc_providencia, :string
  end
end
