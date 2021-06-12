# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_05_235827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "atuendos", force: :cascade do |t|
    t.bigint "torso_id"
    t.bigint "cabeza_id"
    t.bigint "piernas_id"
    t.bigint "pies_id"
    t.integer "puntaje"
    t.bigint "guardarropa_id"
    t.string "nombre"
    t.integer "estacion_tag"
    t.integer "tiempo_tag"
    t.integer "ocasion_tag"
    t.text "descripcion"
    t.bigint "user_id"
    t.index ["cabeza_id"], name: "index_atuendos_on_cabeza_id"
    t.index ["guardarropa_id"], name: "index_atuendos_on_guardarropa_id"
    t.index ["piernas_id"], name: "index_atuendos_on_piernas_id"
    t.index ["pies_id"], name: "index_atuendos_on_pies_id"
    t.index ["torso_id"], name: "index_atuendos_on_torso_id"
    t.index ["user_id"], name: "index_atuendos_on_user_id"
  end

  create_table "guardarropas", force: :cascade do |t|
    t.text "nombre"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_guardarropas_on_user_id"
  end

  create_table "prenda_tipos", force: :cascade do |t|
    t.integer "categoria"
    t.integer "tipo"
  end

  create_table "prendas", force: :cascade do |t|
    t.integer "categoria"
    t.integer "tipo"
    t.integer "material"
    t.string "color_primario"
    t.string "color_secundario"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "guardarropa_id"
    t.bigint "prenda_tipo_id"
    t.bigint "user_id"
    t.index ["guardarropa_id"], name: "index_prendas_on_guardarropa_id"
    t.index ["prenda_tipo_id"], name: "index_prendas_on_prenda_tipo_id"
    t.index ["user_id"], name: "index_prendas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
