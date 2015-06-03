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

ActiveRecord::Schema.define(version: 20150603121230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "empresas_forestales", force: true do |t|
    t.string   "nombre"
    t.string   "abreviado"
    t.string   "rif"
    t.string   "direccion_fiscal"
    t.string   "telefono"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empresas_forestales", ["nombre"], name: "index_empresas_forestales_on_nombre", unique: true, using: :btree
  add_index "empresas_forestales", ["rif"], name: "index_empresas_forestales_on_rif", unique: true, using: :btree
  add_index "empresas_forestales", ["telefono"], name: "index_empresas_forestales_on_telefono", unique: true, using: :btree

  create_table "idiomas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", force: true do |t|
    t.string   "nombre"
    t.integer  "idioma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paises", ["idioma_id"], name: "index_paises_on_idioma_id", using: :btree

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

end
