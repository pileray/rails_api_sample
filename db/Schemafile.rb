# -*- mode: ruby -*-
# vi: set ft=ruby :
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
  t.string "service_name", null: false
  t.bigint "byte_size", null: false
  t.string "checksum"
  t.datetime "created_at", null: false
  t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
end

create_table "active_storage_variant_records", force: :cascade do |t|
  t.bigint "blob_id", null: false
  t.string "variation_digest", null: false
  t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
end

create_table "microposts", force: :cascade do |t|
  t.integer "user_id", null: false
  t.text "content", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["user_id"], name: "index_microposts_on_user_id"
end

create_table "tags", force: :cascade do |t|
  t.string "name", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["name"], name: "index_tags_on_name", unique: true
end

create_table "user_tags", force: :cascade do |t|
  t.integer "user_id", null: false
  t.integer "tag_id", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["tag_id"], name: "index_user_tags_on_tag_id"
  t.index ["user_id", "tag_id"], name: "index_user_tags_on_user_id_and_tag_id", unique: true
  t.index ["user_id"], name: "index_user_tags_on_user_id"
end

create_table "users", force: :cascade do |t|
  t.string "name", null: false
  t.string "email", null: false
  t.string "password_digest", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.text "introduction"
  t.index ["email"], name: "index_users_on_email", unique: true
end

add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
add_foreign_key "microposts", "users"
add_foreign_key "user_tags", "tags"
add_foreign_key "user_tags", "users"
