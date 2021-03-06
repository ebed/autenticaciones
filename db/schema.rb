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

ActiveRecord::Schema.define(version: 20160325151707) do

  create_table "fichas", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "persona_id", limit: 4
  end

  create_table "medicions", force: :cascade do |t|
    t.integer  "ficha_id",         limit: 4
    t.integer  "metrica_id",       limit: 4
    t.string   "valor",            limit: 255
    t.string   "observacion",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "test_instance_id", limit: 4
  end

  create_table "metricas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "detalle",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "test_id",    limit: 4
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "persona_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "second_name", limit: 255
    t.string   "last_name",   limit: 255
    t.date     "dob"
    t.integer  "location_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "second_name",   limit: 255
    t.string   "last_name",     limit: 255
    t.date     "dob"
    t.integer  "location_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "patient_id",    limit: 4
    t.integer  "specialist_id", limit: 4
    t.integer  "rut",           limit: 4
    t.integer  "dv",            limit: 4
  end

  create_table "posts", force: :cascade do |t|
    t.string   "text",            limit: 255
    t.string   "user_id_integer", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "registros", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "ficha_id",      limit: 4
    t.integer  "specialist_id", limit: 4
    t.string   "resumen",       limit: 255
    t.string   "detalle",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "specialists", force: :cascade do |t|
    t.integer  "persona_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "test_instances", force: :cascade do |t|
    t.integer  "test_id",     limit: 4
    t.date     "fecha"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "registro_id", limit: 4
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "tipo_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "nombre",     limit: 255
    t.string   "detalle",    limit: 255
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",              limit: 255, null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
