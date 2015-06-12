#DOCUMENTO REQUERIDO PARA LAS SUBCUENCAS
subcuenca = Vista.create!(nombre: 'subcuenca_docs', descripcion: 'Documentos requeridos para las subcuencas')

subcuenca<< DocumentoRequisito.create!(nombre: 'providencia_doc', descripcion: 'Documento Digital de la Providencia', cardinalidad_maxima: 1, paginado: false, obligatorio: true)