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

ActiveRecord::Schema.define(version: 20180517080503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", id: :serial, force: :cascade do |t|
    t.string "status"
    t.text "keywords"
    t.datetime "started_time"
    t.datetime "finish_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dislikes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_dislikes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_dislikes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_dislikes_on_user_id"
  end

  create_table "likes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "mobile_users", force: :cascade do |t|
    t.integer "phone_number"
    t.string "username"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_mobile_users_on_phone_number", unique: true
    t.index ["username"], name: "index_mobile_users_on_username", unique: true
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "recipient_id"
    t.datetime "read_at"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.boolean "pristine", default: true
    t.string "action_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "photo"
    t.text "caption"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filter"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.integer "likes_count", default: 0
    t.integer "comments_count", default: 0
    t.string "place_id"
    t.json "filter_style"
    t.index ["place_id"], name: "index_posts_on_place_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "queries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "printed_count"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sites", id: :serial, force: :cascade do |t|
    t.string "url"
    t.boolean "scrapped"
    t.boolean "valid_site"
    t.string "title"
    t.boolean "business"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inside_links"
    t.string "outside_links"
    t.string "body"
    t.index ["batch_id"], name: "index_sites_on_batch_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_taggings_on_post_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.bigint "facebook_id"
    t.index ["facebook_id"], name: "index_users_on_facebook_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "websites", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "header"
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "number"
    t.datetime "locked_at"
    t.boolean "fetched", default: false, null: false
    t.text "links"
    t.integer "error_code"
    t.text "error_message"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "dislikes", "posts"
  add_foreign_key "dislikes", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "sites", "batches"
  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
end
