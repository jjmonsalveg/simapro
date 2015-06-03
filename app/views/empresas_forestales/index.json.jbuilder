json.array!(@empresas_forestales) do |empresa_forestal|
  json.extract! empresa_forestal, :id, :nombre, :abreviado, :rif, :direccion_fiscal, :telefono
  json.url empresa_forestal_url(empresa_forestal, format: :json)
end
