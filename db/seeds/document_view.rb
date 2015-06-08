puts '### CREANDO VISTAS ###'
vista_registro_empresa_forestal = Vista.create!(nombre: 'registro_empresa_forestal',
                                       descripcion:
                                           'Imagenes requeridas al momento del registro de la Empresa Forestal')
puts 'vista registro Empresa Forestal Creada'

####### DOCUMENTOS DE INFORMACION GENERAL ################

puts '### CREANDO DOCUMENTOS POR VISTAS ###'

vista_registro_empresa_forestal.documento_requisitos<<
    DocumentoRequisito.create!([{nombre: 'album_empresa_forestal',
                                 descripcion: 'Album Imágenes',
                                 paginado: true,
                                 cardinalidad_maxima: 100}])
puts 'Documentos de vista de registro(ALBUM) Empresa Forestal Creada'
