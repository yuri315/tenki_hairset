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

ActiveRecord::Schema.define(version: 2023_02_16_025001) do

  create_table "advice_materials", charset: "utf8mb4", force: :cascade do |t|
    t.string "forecast_date", null: false
    t.bigint "user_id"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_advice_materials_on_city_id"
    t.index ["user_id"], name: "index_advice_materials_on_user_id"
  end

  create_table "cities", charset: "utf8mb4", force: :cascade do |t|
    t.string "city_name", null: false, comment: "都市名"
    t.float "lat", null: false, comment: "locationの緯度"
    t.float "lon", null: false, comment: "locationの経度"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hairs_features", charset: "utf8mb4", force: :cascade do |t|
    t.string "hair_type"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hairs_features_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weather_forecasts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "advice_material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "temp_max"
    t.float "temp_min"
    t.float "temp_feel"
    t.integer "weather_id"
    t.integer "rainfall"
    t.datetime "date"
    t.float "humidity"
    t.float "wind_speed"
    t.string "weather_icon"
    t.index ["advice_material_id"], name: "index_weather_forecasts_on_advice_material_id"
  end

  add_foreign_key "advice_materials", "cities"
  add_foreign_key "advice_materials", "users"
  add_foreign_key "hairs_features", "users"
  add_foreign_key "weather_forecasts", "advice_materials"
end
