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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170527042547) do

  create_table "melons", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "name"
    t.string   "artist"
    t.string   "album"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "melon_title"
    t.string   "melon_album"
    t.string   "melon_artist"
    t.string   "melon_image"
    t.string   "movie_title"
    t.string   "movie_grade"
    t.string   "movie_rate"
    t.string   "movie_image"
    t.string   "perform_title"
    t.string   "perform_date"
    t.string   "perform_place"
    t.string   "perform_image"
    t.string   "book_title"
    t.string   "book_publisher"
    t.string   "book_writer"
    t.string   "book_image"
    t.string   "google_title"
    t.string   "google_count"
    t.string   "google_image"
    t.string   "musinsa_brand"
    t.string   "musinsa_name"
    t.string   "musinsa_rank"
    t.string   "musinsa_img"
    t.string   "musinsa_before_price"
    t.string   "musinsa_after_price"
    t.string   "navernews_name"
    t.string   "navernews_content"
    t.string   "navernews_img"
    t.string   "naver_weather_statebase"
    t.string   "naver_weather_stateone"
    t.string   "naver_weather_statetwo"
    t.string   "naver_weather_statethree"
    t.string   "naver_weather_statefour"
    t.string   "naver_weather_statefive"
    t.string   "naver_weather_stateimg"
    t.string   "twenty_day"
    t.string   "twenty_odd"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
