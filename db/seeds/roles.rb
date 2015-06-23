puts '#---- Roles  SEEDED ----#'
admin_sistema = Role.create!(name: 'Administrador del Sistema Simapro',
                          permissions: Permission.where(name: 'manage', subject_class: [:Static,
                                                                                        :User,
                                                                                        :Pais,
                                                                                        :EmpresaForestal,
                                                                                        :jquery_file_uploads,
                                                                                        :Role]),
                          role_type: Role.role_types[:administrador_sistema])

admin_cliente = Role.create!(name: 'Administrador de Usuario Simapro',
                          permissions: Permission.where(name: 'manage', subject_class: [:User,
                                                                                        :Static,
                                                                                        :ZonaOrdenamiento,
                                                                                        :UnidadOrdenacion,
                                                                                        :ReservaForestal,
                                                                                        :jquery_file_uploads,
                                                                                        :BloqueOrdenacion,
                                                                                        :UnidadManejo,
                                                                                        :BloqueManejo,
                                                                                        :Especie]),
                          role_type: Role.role_types[:administrador_cliente])

administrador = Role.create!(name: 'Administrador de Datos',
                          permissions: Permission.where(name: 'manage'),
                          role_type: Role.role_types[:cliente])

analista = Role.create!(name: 'Analista Forestal',
                       permissions: Permission.where(name: 'manage'),
                       role_type: Role.role_types[:cliente])

gerente = Role.create!(name: 'Gerente de Operaciones',
                       permissions: Permission.where(name: 'manage'),
                       role_type: Role.role_types[:cliente])

puts '#---- Roles  SEEDED  FINALIZADA----#'
