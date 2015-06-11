json.array!(@unidad_ordenaciones) do |unidad_ordenacion|
  json.extract! unidad_ordenacion, :id, :reserva_forestal_id, :codigo, :nro_contrato, :fecha_otorgacion, :fecha_vence, :area, :descripcion
  json.url unidad_ordenacion_url(unidad_ordenacion, format: :json)
end
