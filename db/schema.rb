
ActiveRecord::Schema.define(version: 2020_04_27_054120) do
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "face"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
