# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150609122948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloque_manejos", force: true do |t|
    t.integer  "bloque_manejo_id"
    t.string   "codigo"
    t.decimal  "area"
    t.integer  "unidad_manejo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bloque_manejos", ["unidad_manejo_id"], name: "index_bloque_manejos_on_unidad_manejo_id", using: :btree

  create_table "bloque_ordenacions", force: true do |t|
    t.integer  "bloque_ordenacion_id"
    t.string   "nombre",               limit: 64,                         null: false
    t.string   "abreviado",            limit: 12,                         null: false
    t.decimal  "area",                            precision: 9, scale: 2
    t.text     "descripcion"
    t.integer  "unidad_ordenacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bloque_ordenacions", ["bloque_ordenacion_id"], name: "index_bloque_ordenacions_on_bloque_ordenacion_id", unique: true, using: :btree
  add_index "bloque_ordenacions", ["unidad_ordenacion_id"], name: "index_bloque_ordenacions_on_unidad_ordenacion_id", using: :btree

  create_table "documento_requisitos", force: true do |t|
    t.string   "nombre",              limit: 50,                  null: false
    t.string   "descripcion",         limit: 100,                 null: false
    t.string   "help",                limit: 100
    t.integer  "cardinalidad_maxima",             default: 1
    t.boolean  "paginado",                        default: false, null: false
    t.boolean  "obligatorio",                     default: true,  null: false
    t.boolean  "almenos_uno",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documento_requisitos", ["nombre"], name: "index_documento_requisitos_on_nombre", unique: true, using: :btree

  create_table "documentos", force: true do |t|
    t.string   "doc"
    t.string   "nombre"
    t.integer  "modelo_id"
    t.string   "modelo_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "documentos_requisitos_por_vista_id"
  end

  add_index "documentos", ["doc", "modelo_id", "modelo_type", "documentos_requisitos_por_vista_id"], name: "index_control_documentos", unique: true, using: :btree
  add_index "documentos", ["documentos_requisitos_por_vista_id"], name: "index_documentos_on_documentos_requisitos_por_vista_id", using: :btree
  add_index "documentos", ["modelo_id"], name: "index_documentos_on_modelo_id", using: :btree

  create_table "documentos_requisitos_por_vistas", force: true do |t|
    t.integer  "documento_requisito_id"
    t.integer  "vista_id"
    t.integer  "grupo_documentos_uno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documentos_requisitos_por_vistas", ["documento_requisito_id", "vista_id"], name: "index_documentos_unique_vista", unique: true, using: :btree
  add_index "documentos_requisitos_por_vistas", ["documento_requisito_id"], name: "index_doc_requisito_intermedia", using: :btree
  add_index "documentos_requisitos_por_vistas", ["grupo_documentos_uno_id"], name: "index_grupo_documentos_uno_intermedia", using: :btree
  add_index "documentos_requisitos_por_vistas", ["vista_id"], name: "index_vista_intermedia", using: :btree

  create_table "empresas_forestales", force: true do |t|
    t.string   "nombre",           null: false
    t.string   "abreviado",        null: false
    t.string   "rif",              null: false
    t.string   "direccion_fiscal", null: false
    t.string   "telefono",         null: false
    t.integer  "pais_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empresas_forestales", ["nombre"], name: "index_empresas_forestales_on_nombre", unique: true, using: :btree
  add_index "empresas_forestales", ["rif"], name: "index_empresas_forestales_on_rif", unique: true, using: :btree
  add_index "empresas_forestales", ["telefono"], name: "index_empresas_forestales_on_telefono", unique: true, using: :btree

  create_table "estados", force: true do |t|
    t.string   "nombre"
    t.string   "codificacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupo_documentos_unos", force: true do |t|
    t.string   "mensaje",    limit: 100, default: "", null: false
    t.string   "icon_color", limit: 15,  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idiomas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "municipios", force: true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "municipios", ["estado_id"], name: "index_municipios_on_estado_id", using: :btree

  create_table "paises", force: true do |t|
    t.string   "nombre"
    t.integer  "idioma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paises", ["idioma_id"], name: "index_paises_on_idioma_id", using: :btree

  create_table "parcela_manejos", force: true do |t|
    t.integer  "parcela_manejo_id"
    t.string   "codigo",            limit: 2
    t.decimal  "area",                        precision: 5, scale: 2
    t.integer  "bloque_manejo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parcela_manejos", ["bloque_manejo_id"], name: "index_parcela_manejos_on_bloque_manejo_id", using: :btree
  add_index "parcela_manejos", ["parcela_manejo_id"], name: "index_parcela_manejos_on_parcela_manejo_id", unique: true, using: :btree

  create_table "permissions", force: true do |t|
    t.string   "subject_class", limit: 60, default: ""
    t.string   "action",        limit: 50, default: "", null: false
    t.string   "name",          limit: 50, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_roles", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  add_index "permissions_roles", ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",       limit: 50, default: "", null: false
    t.integer  "role_type",             default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidad_manejos", force: true do |t|
    t.integer  "unidad_manejo_id"
    t.string   "nombre",               limit: 64,                         null: false
    t.string   "abreviado",            limit: 12,                         null: false
    t.string   "nro_providencia",      limit: 12,                         null: false
    t.date     "fecha_otorgacion"
    t.date     "fecha_vence"
    t.decimal  "area",                            precision: 9, scale: 2
    t.text     "ubicacion"
    t.text     "descripcion"
    t.integer  "bloque_ordenacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unidad_manejos", ["bloque_ordenacion_id"], name: "index_unidad_manejos_on_bloque_ordenacion_id", using: :btree
  add_index "unidad_manejos", ["unidad_manejo_id"], name: "index_unidad_manejos_on_unidad_manejo_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                          default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "email",                             default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "unique_session_id",      limit: 20
    t.integer  "role_id"
    t.string   "name"
    t.string   "cellphone"
    t.string   "avatar"
    t.boolean  "locked",                            default: false
    t.integer  "empresa_forestal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empresa_forestal_id"], name: "index_users_on_empresa_forestal_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vistas", force: true do |t|
    t.string   "descripcion",              limit: 100, default: ""
    t.string   "nombre",                   limit: 35,                  null: false
    t.integer  "index"
    t.boolean  "any_grupo_documentos_uno",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vistas", ["nombre"], name: "index_vistas_on_nombre", unique: true, using: :btree

end
