json.array!(@especies) do |especie|
  json.extract! especie, :id, :nombre_comun, :nombre_cientifico, :sinonimia, :familia, :dmc, :densidad, :grupo_especie_id, :empresa_forestal_id
  json.url especie_url(especie, format: :json)
end
