json.array!(@reserva_forestales) do |reserva_forestal|
  json.extract! reserva_forestal, :id, :empresa_forestal_id, :nombre, :abreviado, :fecha_creacion, :fecha_reglamento, :area, :descripcion
  json.url reserva_forestal_url(reserva_forestal, format: :json)
end
