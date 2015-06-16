p '##  CREACION DE LA EMPRESA FORESTAL ##'
venezuela_id = Pais.where(nombre: 'Venezuela').first.id

empresa_1 = EmpresaForestal.create!(nombre: 'Empresa Forestal Venezolana S.A',
                                    abreviado: 'EMFORVE S.A',
                                    rif: 'J-123456789',
                                    direccion_fiscal: 'Av. Principal La Redoma',
                                    telefono: '0248-1234567',
                                    pais_id: venezuela_id)


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



puts '#---- ADMIN SEEDED ----#'