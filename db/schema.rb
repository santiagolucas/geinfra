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

ActiveRecord::Schema.define(version: 20161023132659) do

  create_table "host_historicos", force: :cascade do |t|
    t.integer  "host_id"
    t.boolean  "nova_situacao"
    t.boolean  "novo_status"
    t.integer  "usuario_id"
    t.string   "motivo",        limit: 1
    t.text     "descricao"
    t.integer  "rede_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "mac"
    t.string   "nome"
    t.text     "descricao"
    t.boolean  "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redes", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.boolean  "ativa"
    t.boolean  "controle_mac"
    t.boolean  "controle_usuario"
    t.string   "grupo_ad"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "nome"
    t.string   "situacao"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "login"
    t.string   "senha"
    t.string   "nome"
    t.string   "situacao",   limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end