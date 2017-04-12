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

ActiveRecord::Schema.define(version: 20170411171113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "host_historicos", force: :cascade do |t|
    t.integer  "host_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.string   "novo_mac"
    t.string   "old_mac"
    t.string   "nova_validade"
    t.string   "old_validade"
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "mac"
    t.string   "nome"
    t.text     "descricao"
    t.boolean  "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "validade"
    t.string   "memorando"
    t.integer  "rede_id"
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
    t.string   "controle_por"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "nome"
    t.string   "situacao"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
