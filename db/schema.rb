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

ActiveRecord::Schema.define(:version => 20130408160500) do

  create_table "answers", :force => true do |t|
    t.text     "response"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "interviews", :force => true do |t|
    t.string   "name"
    t.decimal  "cost"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.decimal  "threshold"
    t.integer  "passing",    :default => 0
    t.integer  "failing",    :default => 0
  end

  create_table "interviews_tags", :id => false, :force => true do |t|
    t.integer "interview_id"
    t.integer "tag_id"
  end

  create_table "progresses", :force => true do |t|
    t.integer  "num_right",    :default => 0
    t.integer  "num_wrong",    :default => 0
    t.float    "percentage"
    t.integer  "interview_id"
    t.integer  "user_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.string   "category"
    t.integer  "interview_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.text     "image"
    t.text     "address"
    t.string   "phone"
    t.float    "lat"
    t.float    "lng"
    t.decimal  "balance",         :default => 0.0
    t.boolean  "is_house",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "customer_id"
  end

end
