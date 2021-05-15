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

ActiveRecord::Schema.define(version: 2021_01_02_213319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.bigint "patient_id", null: false
    t.string "appointment_type_cd"
    t.decimal "price", default: "0.0"
    t.decimal "density", default: "0.0"
    t.decimal "fat", default: "0.0"
    t.decimal "water", default: "0.0"
    t.decimal "mass", default: "0.0"
    t.decimal "organs", default: "0.0"
    t.string "payment_status_cd", default: "yes"
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

  create_table "skin_folds", force: :cascade do |t|
    t.decimal "height", default: "0.0", null: false
    t.decimal "weight", default: "0.0", null: false
    t.decimal "fold1", default: "0.0", null: false
    t.decimal "fold2", default: "0.0", null: false
    t.decimal "fold3", default: "0.0", null: false
    t.decimal "fold4", default: "0.0", null: false
    t.decimal "fold5", default: "0.0", null: false
    t.decimal "fold6", default: "0.0", null: false
    t.decimal "fold7", default: "0.0", null: false
    t.decimal "measure1", default: "0.0", null: false
    t.decimal "measure2", default: "0.0", null: false
    t.decimal "measure3", default: "0.0", null: false
    t.decimal "measure4", default: "0.0", null: false
    t.decimal "measure5", default: "0.0", null: false
    t.bigint "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_skin_folds_on_appointment_id"
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

  add_foreign_key "appointments", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "skin_folds", "appointments"
end
