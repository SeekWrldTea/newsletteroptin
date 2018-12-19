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

ActiveRecord::Schema.define(version: 20181017094623) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "agencies", force: :cascade do |t|
    t.string   "title",                             null: false
    t.string   "address",                           null: false
    t.string   "latitude",   default: "48.8589507", null: false
    t.string   "longitude",  default: "2.2775169",  null: false
    t.integer  "position",   default: 1,            null: false
    t.text     "body",                              null: false
    t.integer  "domain_id",                         null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["domain_id"], name: "index_agencies_on_domain_id"
  end

  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_id"], name: "index_article_categories_on_category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",                        null: false
    t.text     "body",                         null: false
    t.datetime "published_at",                 null: false
    t.boolean  "is_published", default: false, null: false
    t.integer  "domain_id",                    null: false
    t.string   "slug"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["domain_id"], name: "index_articles_on_domain_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "email",          null: false
    t.string   "phone",          null: false
    t.text     "message",        null: false
    t.integer  "domain_id",      null: false
    t.string   "code_form"
    t.string   "main_lots"
    t.string   "second_lots"
    t.string   "energy"
    t.string   "elevator"
    t.string   "people"
    t.string   "syndical"
    t.string   "assembly_date"
    t.string   "postal_code"
    t.string   "city"
    t.string   "sort"
    t.string   "area"
    t.string   "rooms"
    t.string   "state"
    t.text     "other_lots"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "property_id"
    t.string   "job"
    t.string   "address"
    t.string   "recommendation"
    t.string   "cv"
    t.string   "cover_letter"
    t.index ["domain_id"], name: "index_contacts_on_domain_id"
    t.index ["property_id"], name: "index_contacts_on_property_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string   "code",       null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_contents_on_code", unique: true
  end

  create_table "domains", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_mails", force: :cascade do |t|
    t.string   "code_form",  null: false
    t.string   "email",      null: false
    t.integer  "domain_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_form_mails_on_domain_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "guides", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "page_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_guides_on_page_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "image",       null: false
    t.integer  "property_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["property_id"], name: "index_images_on_property_id"
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.string   "image"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_links_on_domain_id"
  end

  create_table "menu_associations", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "page_id"
    t.integer  "link_id"
    t.string   "ancestry"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_menu_associations_on_ancestry"
    t.index ["link_id"], name: "index_menu_associations_on_link_id"
    t.index ["menu_id"], name: "index_menu_associations_on_menu_id"
    t.index ["page_id"], name: "index_menu_associations_on_page_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email",                           null: false
    t.integer  "domain_id",                       null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.index ["domain_id"], name: "index_newsletters_on_domain_id"
  end

  create_table "page_widgets", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.integer  "widget_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_widgets_on_page_id"
    t.index ["widget_id"], name: "index_page_widgets_on_widget_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.string   "slug",       null: false
    t.integer  "seo_id"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_pages_on_domain_id"
    t.index ["seo_id"], name: "index_pages_on_seo_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_parameters_on_code", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "hektor_id",                      null: false
    t.string   "reference",                      null: false
    t.string   "title",                          null: false
    t.text     "body",                           null: false
    t.string   "type_offer",                     null: false
    t.string   "type_property",                  null: false
    t.integer  "price",                          null: false
    t.integer  "charges"
    t.integer  "property_tax"
    t.integer  "nb_floors"
    t.integer  "floor"
    t.string   "city",                           null: false
    t.integer  "postal_code",                    null: false
    t.integer  "cons_energy"
    t.string   "class_energy"
    t.integer  "emission_gaz"
    t.string   "class_emission_gaz"
    t.integer  "living_space"
    t.integer  "land_area"
    t.integer  "nb_rooms"
    t.integer  "bedroom"
    t.integer  "bathroom"
    t.integer  "shower_room"
    t.integer  "restroom"
    t.string   "kitchen"
    t.integer  "parking"
    t.integer  "swimming_pool"
    t.integer  "balcony"
    t.integer  "terrace"
    t.string   "heating"
    t.string   "heating_energy"
    t.string   "heating_format"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "domain_id",          default: 1, null: false
    t.index ["domain_id"], name: "index_properties_on_domain_id"
    t.index ["slug"], name: "index_properties_on_slug", unique: true
  end

  create_table "seos", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "title",                  null: false
    t.string   "image",                  null: false
    t.integer  "position",   default: 1, null: false
    t.integer  "domain_id",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["domain_id"], name: "index_sliders_on_domain_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "subtitle",   null: false
    t.string   "icon",       null: false
    t.string   "url_text",   null: false
    t.string   "url",        null: false
    t.integer  "domain_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_widgets_on_domain_id"
  end

end
