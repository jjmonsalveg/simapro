puts '#---- DEVELOPMENT  SEEDED ----#'
venezuela_id = Pais.where(nombre: 'Venezuela').first.id

p '##  CREACION DE LAS EMPRESAS FORESTALES ##'

empresa_1 = EmpresaForestal.create!(nombre: 'Empresa Forestal Venezolana S.A',
                                    abreviado: 'EMFORVE S.A',
                                    rif: 'J-123456789',
                                    direccion_fiscal: 'Av. Principal La Redoma',
                                    telefono: '0248-1234567',
                                    pais_id: venezuela_id)

p '##  CREACION DE LAS RESERVAS FORESTALES ##'
r = ReservaForestal.create!(empresa_forestal_id: empresa_1.id,
                            nombre: 'Reserva Forestal de Imataca',
                            abreviado: 'Imataca',
                            fecha_creacion: '1/7/1963',
                            fecha_reglamento: '9/22/2004',
                            area: '3749941.20')

p '##  CREACION DE LAS UNIDADES DE ORDENACION ##'
uo = UnidadOrdenacion.create!(reserva_forestal_id: r.id,
                              codigo: 'I',
                              nro_contrato: 'BI-0896',
                              fecha_otorgacion: '3/2/2010',
                              fecha_vence: '3/2/2018',
                              area: '15000000')
                              #unidad_ordenacion_id: 'I', )
zo = ZonaOrdenamiento.create!(unidad_ordenacion: uo, nombre: 'Zona de Manejo Forestal', abreviado: 'ZMF', ubicacion: 'Bolivar - Delta Amacuro', area: '100.00', usos: 'Forestal', descripcion: 'Creada bajo el decreto 3110-04 del 22 de septiembre de 2004', municipios: Municipio.where(id: 1))
bo = BloqueOrdenacion.create!(unidad_ordenacion: uo, nombre: 'Santa Maria I', abreviado: 'SMI', area: '20.00', descripcion: 'Creada bajo el plan de manejo y ordenamientopara el aprovechamiento de la reserva de IMATACA 2006. Posee especies protegidas')
um = UnidadManejo.create!(bloque_ordenacion: bo, nombre: 'Santa Maria IA', abreviado: 'SMIA', area: '5000.00', ubicacion: 'Ubicada en la zona central de la cuenca Santa Maria I', descripcion: 'Entre las especies arbó- reas más abundantes están: Pentaclethra macrocloba (Leguminosae), Alexa imperatricis (Leguminosae), Chaetocarpus schomburgkianus (Euphorbiaceae)', nro_providencia: '1231HH', fecha_otorgacion: '01/01/2015', fecha_vence: '01/01/2016')

p '##  CREACION DE USUARIOS ##'

User.create!(email: 'surf.airwaves@hotmail.com',
             username: 'simapro_admin',
             password: '12345678',
             name: 'Simapro Admin',
             cellphone: '0414-7163143',
             role: Role.where(name: 'Administrador del Sistema Simapro').first,
             avatar: '')

User.create!(email: 'amartinez94@gmail.com',
             username: 'amartinez',
             password: '12345678',
             name: 'Ana Martínez',
             cellphone: '0426-3725256',
             role: Role.where(name: 'Administrador de Usuario Simapro').first,
             avatar: '',
             empresa_forestal_id: empresa_1.id)

User.create!(email: 'anaysabelmar@hotmail.com',
             username: 'jmonsalve',
             password: '12345678',
             name: 'José Monsalve',
             cellphone: '0424-7645003',
             role: Role.where(name: 'Administrador de Datos').first,
             avatar: '',
             empresa_forestal_id: empresa_1.id)

User.create!(email: 'amartinez941@gmail.com',
             username: 'pchourio',
             password: '12345678',
             name: 'Patricia Chourio',
             cellphone: '0426-3725256',
             role: Role.where(name: 'Analista Forestal').first,
             avatar: '',
             empresa_forestal_id: empresa_1.id)

puts '#---- DEVELOPMENT SEEDED  FINALIZADA----#'
