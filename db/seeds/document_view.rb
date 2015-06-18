puts '### CREANDO VISTAS ###'
vista_registro_empresa_forestal = Vista.create!(nombre: 'registro_empresa_forestal',
                                       descripcion:
                                           'Imagenes requeridas al momento del registro de la Empresa Forestal')
puts 'vista registro Empresa Forestal Creada'

vista_registro_zona_ordenamiento = Vista.create!(nombre: 'registro_zona_ordenamiento',
                                                 descripcion:'Documentos requeridos para el registro de una zona de ordenamiento')
puts 'vista registro Zona de Ordenamiento  Creada'

vista_subcuenca = Vista.create!(nombre: 'subcuenca_docs', descripcion: 'Documentos requeridos para las subcuencas')
puts 'vista registro subcuenca  Creada'

vista_reserva_forestal = Vista.create!(nombre: 'reserva_forestal_docs',
                                       descripcion: 'Documento requerido para la reserva forestal')
puts 'vista registro reserva  forestal'

vista_unidad_ordenacion = Vista.create!(nombre: 'unidad_ordenacion_docs',
                                       descripcion: 'Documentos requeridos para la unidad de ordenacion')
puts 'vista unidad ordenacion'




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
                                 cardinalidad_maxima: 1,
                                 obligatorio:false}])
puts 'Documentos de vista de registro(ALBUM) Empresa Forestal Creada'


puts 'Documentos de vista de registro subcuenca Creada'

vista_subcuenca.documento_requisitos<< DocumentoRequisito.create!(nombre: 'providencia_doc', descripcion: 'Documento Digital de la Providencia', cardinalidad_maxima: 1, paginado: false, obligatorio: true)

puts 'Documentos de vista de providencia Creada'

vista_reserva_forestal.documento_requisitos<<
    DocumentoRequisito.create!([{nombre: 'documento_digital_decreto',
                                 descripcion: 'Documento Digital del decreto',
                                 cardinalidad_maxima: 1,
                                 obligatorio:false}])
puts 'Documentos de vista de registro Reserva Forestal Creada'

vista_unidad_ordenacion.documento_requisitos<<
    DocumentoRequisito.create!([{nombre: 'documento_digital_contrato',
                                 descripcion: 'Documento Digital del Contrato',
                                 cardinalidad_maxima: 1,
                                 obligatorio:false},
                                {nombre: 'documento_digital_plan_manejo',
                                 descripcion: 'Documento Digital del Plan de Ordenación y Manejo',
                                 cardinalidad_maxima: 1,
                                 obligatorio:false}])
puts 'Documentos de vista de Unidades de Ordenación'