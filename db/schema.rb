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

ActiveRecord::Schema.define(version: 2019_06_24_150504) do

  create_table "attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.string "e_name", comment: "英名"
    t.string "name_kana", comment: "名前かな"
    t.integer "offensive_power", comment: "攻撃力"
    t.integer "deffensive_power", comment: "守備力"
    t.bigint "attribute_id", comment: "属性"
    t.bigint "tribe_id", comment: "種族"
    t.integer "level", comment: "レベル"
    t.integer "rank", comment: "ランク"
    t.integer "link", comment: "リンク"
    t.string "other", comment: "その他項目"
    t.string "effect", comment: "効果"
    t.integer "pendulum_scale", comment: "ペンデュラムスケール"
    t.text "pendulum_effect", comment: "ペンデュラム効果"
    t.text "text", comment: "カードテキスト"
    t.string "number", comment: "商品番号"
    t.text "image", comment: "カード画像"
    t.text "image_original", comment: "サイト元カード画像"
    t.integer "flag", comment: "フラグ"
    t.string "original_url", comment: "サイト元URL"
    t.text "innerhtml", comment: "innerhtml"
    t.integer "price", comment: "価格"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_cards_on_attribute_id"
    t.index ["tribe_id"], name: "index_cards_on_tribe_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.integer "title", comment: "タイトル（属性・種族・テーマ）"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deck_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "deck_id", comment: "デッキ"
    t.bigint "card_id", comment: "カード"
    t.integer "deck_type", comment: "デッキタイプ"
    t.integer "count", comment: "枚数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
  end

  create_table "deck_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", comment: "ユーザ"
    t.bigint "deck_id", comment: "デッキ"
    t.text "comment", comment: "コメント"
    t.integer "flag", comment: "フラグ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_deck_comments_on_deck_id"
    t.index ["user_id"], name: "index_deck_comments_on_user_id"
  end

  create_table "decks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.bigint "category_id", comment: "カテゴリ"
    t.bigint "user_id", comment: "ユーザ"
    t.text "main", comment: "メイン"
    t.text "side", comment: "サイド"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_decks_on_category_id"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "record_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_id", comment: "カード"
    t.bigint "record_id", comment: "収録シリーズ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_record_cards_on_card_id"
    t.index ["record_id"], name: "index_record_cards_on_record_id"
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "release_date", comment: "発売日"
    t.string "number", comment: "収録番号"
    t.string "name", comment: "名称"
    t.string "specification", comment: "仕様"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_decks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tournament_id", comment: "大会"
    t.bigint "deck_id", comment: "デッキ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_tournament_decks_on_deck_id"
    t.index ["tournament_id"], name: "index_tournament_decks_on_tournament_id"
  end

  create_table "tournaments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.date "date"
    t.string "place", comment: "開催場所"
    t.integer "stage", comment: "大会レベル"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tribes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.integer "flag", default: 0, comment: "フラグ"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
