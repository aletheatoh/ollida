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

ActiveRecord::Schema.define(version: 20170430173239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "album_volumes", force: :cascade do |t|
    t.date     "vote_start"
    t.date     "vote_end"
    t.string   "award"
    t.string   "artiste"
    t.string   "song"
    t.float    "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_kor"
    t.text     "profile_img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "mcountdown"
  end

  create_table "artistes", force: :cascade do |t|
    t.string   "profile_img"
    t.string   "name_eng"
    t.string   "name_kor"
    t.string   "mcountdown"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.text     "profile_img"
    t.hstore   "judging_criteria", default: {}, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "masthead_img"
    t.text     "description"
  end

  create_table "digital_sales", force: :cascade do |t|
    t.date     "date_d"
    t.integer  "artiste_id"
    t.integer  "song_id"
    t.float    "download_cnt"
    t.float    "stream_cnt"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "digital_service_providers", force: :cascade do |t|
    t.string "name"
    t.text   "profile_img"
    t.text   "home_url"
  end

  create_table "mcountdown_rankings", force: :cascade do |t|
    t.integer  "nominee_id"
    t.float    "mcountdown_votes"
    t.float    "normalized_mv"
    t.float    "youtube_views"
    t.float    "normalized_yv"
    t.float    "download_cnt"
    t.float    "stream_cnt"
    t.float    "normalized_ds"
    t.float    "remainder"
    t.float    "score"
    t.integer  "ranking"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "mcountdown_votes", force: :cascade do |t|
    t.date     "date_d"
    t.integer  "artiste_id"
    t.integer  "song_id"
    t.float    "mcountdown_votes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "nomination_cycles", force: :cascade do |t|
    t.integer  "award_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "period_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "ranking_present", default: false
  end

  create_table "nominees", force: :cascade do |t|
    t.integer  "cycle_id"
    t.integer  "artiste_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_kor"
    t.integer  "artiste_id"
    t.integer  "album_id"
    t.string   "mcountdown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "melon"
    t.string   "bugs"
    t.string   "genie"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "username"
    t.boolean  "gender"
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "youtube_videos", force: :cascade do |t|
    t.integer  "artiste_id"
    t.integer  "song_id"
    t.string   "video_id"
    t.text     "watch_link"
    t.text     "thumbnail_img"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "video_title"
  end

  create_table "youtube_views", force: :cascade do |t|
    t.date     "date_d"
    t.integer  "youtube_id"
    t.float    "youtube_views"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "artiste_id"
    t.integer  "song_id"
  end

end
