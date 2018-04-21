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


ActiveRecord::Schema.define(version: 20180421021254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"
  enable_extension "xml2"
  enable_extension "ltree"
  enable_extension "pgstattuple"
  enable_extension "tablefunc"
  enable_extension "fuzzystrmatch"
  enable_extension "citext"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"
  enable_extension "pg_trgm"
  enable_extension "intarray"
  enable_extension "hstore"
  enable_extension "dict_int"
  enable_extension "btree_gin"
  enable_extension "pgrowlocks"
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "btree_gist"
  enable_extension "dict_xsyn"
  enable_extension "unaccent"
  enable_extension "pg_stat_statements"
  enable_extension "plv8"
  enable_extension "postgis"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cliente", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "rut"
    t.boolean "eliminado", default: false
  end

  create_table "estado", id: :serial, force: :cascade do |t|
    t.string "nombre"
  end

  create_table "gasto", id: :serial, force: :cascade do |t|
    t.integer "id_proyecto"
    t.string "descripcion"
    t.integer "id_proveedor"
    t.integer "id_tipo_documento"
    t.integer "num_documento"
    t.date "fecha"
    t.integer "valor"
    t.integer "id_rendido_usuario"
    t.integer "id_estado"
    t.boolean "aprobado", default: false
    t.boolean "eliminado", default: false
  end

  create_table "historialgasto", id: :serial, force: :cascade do |t|
    t.integer "id_usuario"
    t.integer "id_gasto"
    t.string "descripcion"
    t.date "fecha"
  end

  create_table "historialingreso", id: :serial, force: :cascade do |t|
    t.integer "id_usuario"
    t.integer "id_ingreso"
    t.string "descripcion"
    t.date "fecha"
  end

  create_table "ingreso", id: :serial, force: :cascade do |t|
    t.integer "id_proyecto"
    t.integer "id_tipo_documento"
    t.integer "id_cliente"
    t.integer "num_documento"
    t.date "fecha"
    t.integer "valor"
    t.integer "id_estado"
    t.boolean "eliminado", default: false
  end

  create_table "marca", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.integer "id_cliente"
    t.boolean "eliminado", default: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "proveedor", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.string "descripcion"
    t.boolean "eliminado", default: false
  end

  create_table "proyecto", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.integer "id_cliente"
    t.integer "id_marca"
    t.string "descripcion"
    t.date "fecha_inicio"
    t.date "fecha_termino"
    t.boolean "eliminado", default: false
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
  end

  create_table "tipodocumento", id: :serial, force: :cascade do |t|
    t.string "nombre"
  end

  create_table "tipousuario", id: :serial, force: :cascade do |t|
    t.string "nombre"
  end

  create_table "usuario", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.integer "tipo_usuario"
    t.boolean "eliminado", default: false
  end

  create_table "usuarioproyecto", id: false, force: :cascade do |t|
    t.integer "id_usuario"
    t.integer "id_proyecto"
    t.boolean "eliminado", default: false
  end

  add_foreign_key "gasto", "estado", column: "id_estado", name: "gasto_id_estado_fkey"
  add_foreign_key "gasto", "proveedor", column: "id_proveedor", name: "gasto_id_proveedor_fkey"
  add_foreign_key "gasto", "proyecto", column: "id_proyecto", name: "gasto_id_proyecto_fkey"
  add_foreign_key "gasto", "tipodocumento", column: "id_tipo_documento", name: "gasto_id_tipo_documento_fkey"
  add_foreign_key "gasto", "usuario", column: "id_rendido_usuario", name: "gasto_id_rendido_usuario_fkey"
  add_foreign_key "historialgasto", "gasto", column: "id_gasto", name: "historialgasto_id_gasto_fkey"
  add_foreign_key "historialgasto", "usuario", column: "id_usuario", name: "historialgasto_id_usuario_fkey"
  add_foreign_key "historialingreso", "ingreso", column: "id_ingreso", name: "historialingreso_id_ingreso_fkey"
  add_foreign_key "historialingreso", "usuario", column: "id_usuario", name: "historialingreso_id_usuario_fkey"
  add_foreign_key "ingreso", "cliente", column: "id_cliente", name: "ingreso_id_cliente_fkey"
  add_foreign_key "ingreso", "estado", column: "id_estado", name: "ingreso_id_estado_fkey"
  add_foreign_key "ingreso", "proyecto", column: "id_proyecto", name: "ingreso_id_proyecto_fkey"
  add_foreign_key "ingreso", "tipodocumento", column: "id_tipo_documento", name: "ingreso_id_tipo_documento_fkey"
  add_foreign_key "marca", "cliente", column: "id_cliente", name: "marca_id_cliente_fkey"
  add_foreign_key "proyecto", "cliente", column: "id_cliente", name: "proyecto_id_cliente_fkey"
  add_foreign_key "proyecto", "marca", column: "id_marca", name: "proyecto_id_marca_fkey"
  add_foreign_key "usuario", "tipousuario", column: "tipo_usuario", name: "usuario_tipo_usuario_fkey"
  add_foreign_key "usuarioproyecto", "proyecto", column: "id_proyecto", name: "usuarioproyecto_id_proyecto_fkey"
  add_foreign_key "usuarioproyecto", "usuario", column: "id_usuario", name: "usuarioproyecto_id_usuario_fkey"
end
