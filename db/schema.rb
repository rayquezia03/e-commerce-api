# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_02_01_124745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["deleted_at"], name: "index_active_storage_attachments_on_deleted_at"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_active_storage_blobs_on_deleted_at"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.datetime "deleted_at"
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    t.index ["deleted_at"], name: "index_active_storage_variant_records_on_deleted_at"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["deleted_at"], name: "index_cart_items_on_deleted_at"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_carts_on_deleted_at"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "cUF"
    t.string "cNF"
    t.string "natOp"
    t.string "mod"
    t.integer "serie"
    t.integer "nNF"
    t.datetime "dhEmi"
    t.string "tpNF"
    t.string "idDest"
    t.string "cMunFG"
    t.string "tpImp"
    t.string "tpEmis"
    t.string "cDV"
    t.string "tpAmb"
    t.string "chave_acesso"
    t.string "nome_emitente"
    t.string "cnpj_emitente"
    t.string "logradouro_emitente"
    t.integer "numero_emitente"
    t.string "bairro_emitente"
    t.string "municipio_emitente"
    t.string "uf_emitente"
    t.string "cep_emitente"
    t.string "nome_destinatario"
    t.string "cnpj_destinatario"
    t.string "logradouro_destinatario"
    t.integer "numero_destinatario"
    t.string "bairro_destinatario"
    t.string "municipio_destinatario"
    t.string "uf_destinatario"
    t.string "cep_destinatario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "document_name"
    t.string "file_xml"
    t.string "content_type"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_documents_on_deleted_at"
  end

  create_table "imports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_imports_on_deleted_at"
  end

  create_table "operation_products", force: :cascade do |t|
    t.string "nome"
    t.string "ncm"
    t.string "cfop"
    t.string "unidade_comercializada"
    t.decimal "quantidade_comercializada", precision: 10, scale: 2
    t.decimal "valor_unitario", precision: 10, scale: 2
    t.decimal "valor_total", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "document_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_operation_products_on_deleted_at"
    t.index ["document_id"], name: "index_operation_products_on_document_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cart_id", null: false
    t.decimal "total", precision: 10, scale: 2
    t.string "status", default: "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "stock_quantity"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "section"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
  end

  create_table "taxas", force: :cascade do |t|
    t.decimal "valor_icms", precision: 10, scale: 2
    t.decimal "valor_ipi", precision: 10, scale: 2
    t.decimal "valor_pis", precision: 10, scale: 2
    t.decimal "valor_cofins", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "document_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_taxas_on_deleted_at"
    t.index ["document_id"], name: "index_taxas_on_document_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "deleted_at"
    t.boolean "is_admin"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "users"
end
