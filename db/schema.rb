# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120214231555) do

  create_table "anchor_point_heights", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "sci_name"
    t.text     "description"
  end

  create_table "category_pictures", :force => true do |t|
    t.integer  "category_id"
    t.string   "picture"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "category_pictures", ["category_id"], :name => "index_category_pictures_on_category_id"

  create_table "exercise_accessories", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "accessory_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "primary",      :default => false
  end

  add_index "exercise_accessories", ["accessory_id"], :name => "index_exercise_accessories_on_accessory_id"
  add_index "exercise_accessories", ["exercise_id", "accessory_id"], :name => "index_exercise_accessories_on_exercise_id_and_accessory_id", :unique => true
  add_index "exercise_accessories", ["exercise_id"], :name => "index_exercise_accessories_on_exercise_id"

  create_table "exercise_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_categories", ["category_id", "exercise_id"], :name => "index_exercise_categories_on_category_id_and_exercise_id", :unique => true
  add_index "exercise_categories", ["category_id"], :name => "index_exercise_categories_on_category_id"
  add_index "exercise_categories", ["exercise_id"], :name => "index_exercise_categories_on_exercise_id"

  create_table "exercise_forces", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "force_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_forces", ["exercise_id", "force_id"], :name => "index_exercise_forces_on_exercise_id_and_force_id", :unique => true
  add_index "exercise_forces", ["exercise_id"], :name => "index_exercise_forces_on_exercise_id"
  add_index "exercise_forces", ["force_id"], :name => "index_exercise_forces_on_force_id"

  create_table "exercise_heights", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "height_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_heights", ["exercise_id", "height_id"], :name => "index_exercise_heights_on_exercise_id_and_height_id", :unique => true
  add_index "exercise_heights", ["exercise_id"], :name => "index_exercise_heights_on_exercise_id"
  add_index "exercise_heights", ["height_id"], :name => "index_exercise_heights_on_height_id"

  create_table "exercise_muscles", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "muscle_id"
    t.boolean  "primary",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "exercise_muscles", ["exercise_id", "muscle_id"], :name => "index_exercise_muscles_on_exercise_id_and_muscle_id", :unique => true
  add_index "exercise_muscles", ["exercise_id"], :name => "index_exercise_muscles_on_exercise_id"
  add_index "exercise_muscles", ["muscle_id"], :name => "index_exercise_muscles_on_muscle_id"

  create_table "exercise_pictures", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "picture"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_pictures", ["exercise_id"], :name => "index_exercise_pictures_on_exercise_id"

  create_table "exercise_positions", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_positions", ["exercise_id", "position_id"], :name => "index_exercise_positions_on_exercise_id_and_position_id", :unique => true
  add_index "exercise_positions", ["exercise_id"], :name => "index_exercise_positions_on_exercise_id"
  add_index "exercise_positions", ["position_id"], :name => "index_exercise_positions_on_position_id"

  create_table "exercise_posts", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "post_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_posts", ["exercise_id", "post_id"], :name => "index_exercise_posts_on_exercise_id_and_post_id", :unique => true
  add_index "exercise_posts", ["exercise_id"], :name => "index_exercise_posts_on_exercise_id"
  add_index "exercise_posts", ["post_id"], :name => "index_exercise_posts_on_post_id"

  create_table "exercise_workouts", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_workouts", ["exercise_id"], :name => "index_exercise_workouts_on_exercise_id"
  add_index "exercise_workouts", ["workout_id"], :name => "index_exercise_workouts_on_workout_id"

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "forces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "general_tips", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glossaries", :force => true do |t|
    t.string   "term"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "glossary_pictures", :force => true do |t|
    t.integer  "glossary_id"
    t.string   "picture"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "optional_accessories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "picture"
    t.string   "store_link"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "target_muscles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tips", :force => true do |t|
    t.integer  "exercise_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "variations", :force => true do |t|
    t.integer  "exercise_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "location"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.string   "sets"
    t.string   "reps"
    t.string   "per_week"
    t.string   "duration"
    t.string   "tempo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
