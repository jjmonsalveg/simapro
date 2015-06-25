json.array!(@grupo_especies) do |grupo_especie|
  json.extract! grupo_especie, :id, :nombre, :codigo
  json.url grupo_especie_url(grupo_especie, format: :json)
end
