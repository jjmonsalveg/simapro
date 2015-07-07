json.array!(@especies) do |especie|
  json.extract! especie, :nombre_comun
end