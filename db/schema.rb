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
    t.text "reason"
    t.text "first_reason"
    t.text "second_reason"
    t.integer "third_reason"
    t.integer "fourth_reason"
    t.integer "brystol"
    t.integer "urine"
    t.text "health_situation"
    t.text "drugs_and_supplements"
    t.boolean "smoker"
    t.boolean "alcohol"
    t.text "alergies"
    t.text "food_intolerance"
    t.boolean "hair_loss"
    t.text "beento_nutri"
    t.text "bowel"
    t.text "constipation"
    t.text "water_consumption"
    t.text "chewing"
    t.text "sleep"
    t.text "stress"
    t.boolean "exercise"
    t.text "exercise_type"
    t.text "exercise_frequency"
    t.text "exercise_duration"
    t.integer "exercise_tired"
    t.text "make_your_food"
    t.text "eat_out"
    t.text "can_eat"
    t.text "cant_eat"
    t.boolean "drink_soda"
    t.boolean "drink_juice"
    t.boolean "fried_food"
    t.text "fried_frequency"
    t.boolean "candy"
    t.text "candy_frequency"
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
    t.boolean "payment_status", default: true
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
end
