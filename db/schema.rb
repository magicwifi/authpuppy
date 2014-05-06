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

ActiveRecord::Schema.define(:version => 20140506023634) do

  create_table "access_nodes", :force => true do |t|
    t.string   "name"
    t.string   "mac"
    t.integer  "sys_uptime"
    t.integer  "sys_upload"
    t.integer  "sys_memfree"
    t.string   "remote_addr"
    t.integer  "update_time"
    t.datetime "last_seen"
    t.string   "redirect_url"
    t.string   "portal_url"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "configflag",   :default => false
    t.string   "cmdline"
    t.integer  "time_limit"
    t.float    "lat",          :default => 32.0266
    t.float    "long",         :default => 118.788
    t.string   "developer"
    t.boolean  "cmdflag"
  end

  add_index "access_nodes", ["mac"], :name => "index_access_nodes_on_mac", :unique => true

  create_table "access_nods", :force => true do |t|
    t.string   "name"
    t.string   "mac"
    t.string   "redirect_url"
    t.string   "portal_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "token"
  end

  create_table "auths", :force => true do |t|
    t.string   "auth_type",      :default => "radius"
    t.boolean  "auth_device",    :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "access_node_id"
  end

  create_table "black_macs", :force => true do |t|
    t.integer  "access_node_id"
    t.string   "mac"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "confs", :force => true do |t|
    t.integer  "checkinterval",  :default => 60
    t.integer  "authinterval",   :default => 120
    t.integer  "clienttimeout",  :default => 5
    t.integer  "httpmaxconn",    :default => 10
    t.integer  "access_node_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "connections", :force => true do |t|
    t.string   "token"
    t.string   "ipaddr"
    t.string   "access_mac"
    t.datetime "used_on"
    t.datetime "expired_on"
    t.string   "mac"
    t.integer  "incoming",       :default => 0
    t.integer  "outgoing",       :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "access_node_id"
    t.string   "device"
    t.string   "portal_url"
    t.string   "phonenum"
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "password_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "public_ips", :force => true do |t|
    t.integer  "access_node_id"
    t.string   "publicip"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "code"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trusted_macs", :force => true do |t|
    t.integer  "access_node_id"
    t.string   "mac"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
