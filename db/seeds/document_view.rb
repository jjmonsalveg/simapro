puts '### CREANDO VISTAS ###'
vista_registro_empresa_forestal = Vista.create!(nombre: 'registro_empresa_forestal',
                                       descripcion:
                                           'Imagenes requeridas al momento del registro de la Empresa Forestal')
puts 'vista registro Empresa Forestal Creada'

vista_registro_zona_ordenamiento = Vista.create!(nombre: 'registro_zona_ordenamiento',
                                                 descripcion:'Documentos requeridos para el registro de una zona de ordenamiento')
puts 'vista registro Zona de Ordenamiento  Creada'

####### DOCUMENTOS DE INFORMACION GENERAL ################

puts '### CREANDO DOCUMENTOS POR VISTAS ###'

vista_registro_empresa_forestal.documento_requisitos<<
    DocumentoRequisito.create!([{nombre: 'album_empresa_forestal',
                                 descripcion: 'Album Imágenes',
                                 paginado: true,
                                 cardinalidad_maxima: 100}])

vista_registro_zona_ordenamiento.documento_requisitos<<
    DocumentoRequisito.create!([{nombre: 'documento_digital',
                                 descripcion: 'Documento Digital de la zona',
                                 cardinalidad_maxima: 1}])
puts 'Documentos de vista de registro(ALBUM) Empresa Forestal Creada'
