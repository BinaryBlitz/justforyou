class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    
    create_table "addresses", force: :cascade do |t|
      t.text     "content",    null: false
      t.integer  "entrance"
      t.integer  "floor"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.float    "latitude",   null: false
      t.float    "longitude",  null: false
      t.datetime "deleted_at"
      t.integer  "apartment"
      t.string   "house"
      t.index ["deleted_at"], name: "index_addresses_on_deleted_at", using: :btree
      t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
    end
    
    create_table "admins", force: :cascade do |t|
      t.string   "email",                  default: "",      null: false
      t.string   "encrypted_password",     default: "",      null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,       null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet     "current_sign_in_ip"
      t.inet     "last_sign_in_ip"
      t.datetime "created_at",                               null: false
      t.datetime "updated_at",                               null: false
      t.string   "type",                   default: "Admin"
      t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    end
    
    create_table "blocks", force: :cascade do |t|
      t.string   "name",                       null: false
      t.string   "image",                      null: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
      t.integer  "programs_count", default: 0
      t.string   "color"
      t.index ["color"], name: "index_blocks_on_color", unique: true, using: :btree
    end
    
    create_table "configurables", force: :cascade do |t|
      t.string   "name"
      t.string   "value"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["name"], name: "index_configurables_on_name", using: :btree
    end
    
    create_table "days", force: :cascade do |t|
      t.integer  "position",   null: false
      t.integer  "program_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["program_id"], name: "index_days_on_program_id", using: :btree
    end
    
    create_table "deliveries", force: :cascade do |t|
      t.integer  "status",              default: 0
      t.datetime "scheduled_for",                       null: false
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
      t.integer  "address_id"
      t.integer  "purchase_id"
      t.text     "comment"
      t.boolean  "paid",                default: false
      t.integer  "delivery_invoice_id"
      t.index ["address_id"], name: "index_deliveries_on_address_id", using: :btree
      t.index ["delivery_invoice_id"], name: "index_deliveries_on_delivery_invoice_id", using: :btree
      t.index ["purchase_id"], name: "index_deliveries_on_purchase_id", using: :btree
    end
    
    create_table "delivery_invoices", force: :cascade do |t|
      t.integer  "user_id"
      t.boolean  "paid",       default: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
      t.index ["user_id"], name: "index_delivery_invoices_on_user_id", using: :btree
    end
    
    create_table "exchanges", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "purchase_id"
      t.integer  "program_id"
      t.boolean  "paid",            default: false
      t.integer  "pending_balance", default: 0
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.integer  "total_price"
      t.index ["program_id"], name: "index_exchanges_on_program_id", using: :btree
      t.index ["purchase_id"], name: "index_exchanges_on_purchase_id", using: :btree
      t.index ["user_id"], name: "index_exchanges_on_user_id", using: :btree
    end
    
    create_table "items", force: :cascade do |t|
      t.text     "content",    null: false
      t.integer  "weight",     null: false
      t.float    "calories",   null: false
      t.time     "starts_at",  null: false
      t.time     "ends_at",    null: false
      t.integer  "day_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["day_id"], name: "index_items_on_day_id", using: :btree
    end
    
    create_table "line_items", force: :cascade do |t|
      t.integer  "order_id"
      t.integer  "program_id"
      t.integer  "number_of_days", null: false
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
      t.index ["program_id"], name: "index_line_items_on_program_id", using: :btree
    end
    
    create_table "orders", force: :cascade do |t|
      t.string   "phone_number",                    null: false
      t.text     "comment"
      t.integer  "user_id"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.boolean  "paid",            default: false
      t.integer  "pending_balance", default: 0
      t.boolean  "use_balance",     default: false
      t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    end
    
    create_table "payment_cards", force: :cascade do |t|
      t.string   "number",        null: false
      t.string   "holder",        null: false
      t.string   "rebill_anchor", null: false
      t.integer  "user_id"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.index ["user_id"], name: "index_payment_cards_on_user_id", using: :btree
    end
    
    create_table "payments", force: :cascade do |t|
      t.integer  "amount",                          null: false
      t.boolean  "paid",            default: false
      t.integer  "payment_card_id"
      t.integer  "transaction_id"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.string   "payable_type"
      t.integer  "payable_id"
      t.index ["payable_type", "payable_id"], name: "index_payments_on_payable_type_and_payable_id", using: :btree
      t.index ["payment_card_id"], name: "index_payments_on_payment_card_id", using: :btree
    end
    
    create_table "product_types", force: :cascade do |t|
      t.string   "name",       null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    
    create_table "products", force: :cascade do |t|
      t.string   "name",            null: false
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.integer  "product_type_id"
      t.index ["product_type_id"], name: "index_products_on_product_type_id", using: :btree
    end
    
    create_table "programs", force: :cascade do |t|
      t.string   "name",                         null: false
      t.text     "description",                  null: false
      t.integer  "threshold",                    null: false
      t.integer  "primary_price",                null: false
      t.integer  "secondary_price",              null: false
      t.string   "image",                        null: false
      t.datetime "created_at",                   null: false
      t.datetime "updated_at",                   null: false
      t.integer  "block_id"
      t.text     "prescription",    default: [],              array: true
      t.string   "preview"
      t.index ["block_id"], name: "index_programs_on_block_id", using: :btree
    end
    
    create_table "promotions", force: :cascade do |t|
      t.string   "name",        null: false
      t.text     "description", null: false
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
    
    create_table "purchases", force: :cascade do |t|
      t.integer  "number_of_days",               null: false
      t.integer  "program_id"
      t.integer  "user_id"
      t.datetime "created_at",                   null: false
      t.datetime "updated_at",                   null: false
      t.integer  "deliveries_count", default: 0
      t.index ["program_id"], name: "index_purchases_on_program_id", using: :btree
      t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
    end
    
    create_table "substitutions", force: :cascade do |t|
      t.integer  "product_id"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id", "user_id"], name: "index_substitutions_on_product_id_and_user_id", unique: true, using: :btree
      t.index ["product_id"], name: "index_substitutions_on_product_id", using: :btree
      t.index ["user_id"], name: "index_substitutions_on_user_id", using: :btree
    end
    
    create_table "users", force: :cascade do |t|
      t.string   "first_name",               null: false
      t.string   "last_name",                null: false
      t.string   "phone_number",             null: false
      t.string   "email",                    null: false
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.string   "api_token"
      t.integer  "balance",      default: 0
      t.string   "device_token"
      t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
    end
    
    create_table "verification_tokens", force: :cascade do |t|
      t.string   "token",                        null: false
      t.string   "phone_number",                 null: false
      t.integer  "code",                         null: false
      t.boolean  "verified",     default: false
      t.datetime "created_at",                   null: false
      t.datetime "updated_at",                   null: false
      t.index ["token"], name: "index_verification_tokens_on_token", unique: true, using: :btree
    end
    
    add_foreign_key "addresses", "users"
    add_foreign_key "days", "programs"
    add_foreign_key "deliveries", "addresses"
    add_foreign_key "deliveries", "purchases"
    add_foreign_key "delivery_invoices", "users"
    add_foreign_key "exchanges", "purchases"
    add_foreign_key "exchanges", "users"
    add_foreign_key "items", "days"
    add_foreign_key "line_items", "orders"
    add_foreign_key "line_items", "programs"
    add_foreign_key "orders", "users"
    add_foreign_key "payment_cards", "users"
    add_foreign_key "products", "product_types"
    add_foreign_key "programs", "blocks"
    add_foreign_key "purchases", "programs"
    add_foreign_key "purchases", "users"
    add_foreign_key "substitutions", "products"
    add_foreign_key "substitutions", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
