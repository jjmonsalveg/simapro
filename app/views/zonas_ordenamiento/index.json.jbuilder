json.array!(@zonas_ordenamiento) do |zona_ordenamiento|
  json.extract! zona_ordenamiento, :id, :nombre, :abreviado, :ubicacion, :area, :usos, :descripcion
  json.url zona_ordenamiento_url(zona_ordenamiento, format: :json)
end
