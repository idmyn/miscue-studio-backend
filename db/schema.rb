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

ActiveRecord::Schema.define(version: 2019_12_09_151215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mistakes", force: :cascade do |t|
    t.string "type"
    t.bigint "reading_id", null: false
    t.bigint "story_word_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reading_id"], name: "index_mistakes_on_reading_id"
    t.index ["story_word_id"], name: "index_mistakes_on_story_word_id"
  end

  create_table "readings", force: :cascade do |t|
    t.datetime "date"
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.bigint "story_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_readings_on_story_id"
    t.index ["student_id"], name: "index_readings_on_student_id"
    t.index ["teacher_id"], name: "index_readings_on_teacher_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "story_words", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.bigint "word_id", null: false
    t.integer "index"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_story_words_on_story_id"
    t.index ["word_id"], name: "index_story_words_on_word_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mistakes", "readings"
  add_foreign_key "mistakes", "story_words"
  add_foreign_key "readings", "stories"
  add_foreign_key "readings", "students"
  add_foreign_key "readings", "teachers"
  add_foreign_key "story_words", "stories"
  add_foreign_key "story_words", "words"
  add_foreign_key "students", "teachers"
end
