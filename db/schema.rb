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

ActiveRecord::Schema.define(version: 2020_04_18_175617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anamneses", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.string "reason"
    t.string "first_reason"
    t.string "second_reason"
    t.string "third_reason"
    t.integer "fourth_reason"
    t.string "health_situation"
    t.string "drugs_and_supplements"
    t.boolean "smoker"
    t.boolean "alcohol"
    t.string "alergies"
    t.string "food_intolerance"
    t.boolean "hair_loss"
    t.string "beento_nutri"
    t.string "bowel"
    t.string "constipation"
    t.string "water_consumption"
    t.string "chewing"
    t.string "sleep"
    t.string "stress"
    t.boolean "exercise"
    t.string "exercise_type"
    t.string "exercise_frequency"
    t.string "exercise_duration"
    t.integer "exercise_tired"
    t.string "make_your_food"
    t.string "eat_out"
    t.string "can_eat"
    t.string "cant_eat"
    t.boolean "drink_soda"
    t.boolean "drink_juice"
    t.boolean "fried_food"
    t.string "fried_frequency"
    t.boolean "candy"
    t.string "candy_frequency"
    t.boolean "legumes_fruits_leaves"
    t.boolean "oats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_anamneses_on_appointment_id", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.bigint "patient_id", null: false
    t.string "appointment_type"
    t.integer "price_cents", default: 0
    t.boolean "payment_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "profession"
    t.string "gender"
    t.string "street"
    t.integer "number"
    t.string "state"
    t.string "country"
    t.string "city"
    t.string "avatar"
    t.string "cpf"
    t.string "email"
    t.text "obs"
    t.string "phone"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_taggings_on_patient_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anamneses", "appointments"
  add_foreign_key "appointments", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "taggings", "patients"
  add_foreign_key "taggings", "tags"
end
