class InitSchema < ActiveRecord::Migration[5.2]
  def up
    # 属性
    create_table :attributes, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名称'
      t.timestamps
    end

    # 種族
    create_table :tribes, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名称'
      t.timestamps
    end

    # カード詳細
    create_table :cards, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名前'
      t.string         :e_name, comment: '英名'
      t.string         :name_kana, comment: '名前かな'
      t.integer        :offensive_power, comment: '攻撃力'
      t.integer        :deffensive_power, comment: '守備力'
      t.references     :attribute, comment: '属性'
      t.references     :tribe, comment: '種族'
      t.integer        :level, comment: 'レベル'
      t.integer        :rank, comment: 'ランク'
      t.integer        :link, comment: 'リンク'
      t.string         :other, comment: 'その他項目'
      t.string         :effect, comment: '効果'
      t.integer        :pendulum_scale, comment: 'ペンデュラムスケール'
      t.text           :pendulum_effect, comment: 'ペンデュラム効果'
      t.text           :text, comment: 'カードテキスト'
      t.string         :number, comment: '商品番号'
      t.text           :image, comment: 'カード画像'
      t.text           :image_original, comment: 'サイト元カード画像'
      t.integer        :flag, comment: 'フラグ'
      t.string         :original_url, comment: 'サイト元URL'
      t.text           :innerhtml, comment: 'innerhtml'
      t.integer        :price, comment: '価格'
      t.timestamps
    end

    # カード収録シリーズ
    create_table :records, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.date           :release_date, comment: '発売日'
      t.string         :number, comment: '収録番号'
      t.string         :name, comment: '名称'
      t.string        :specification, comment: '仕様'
      t.timestamps
    end

    # カードとカード収録シリーズ
    create_table :record_cards, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.references     :card, comment: 'カード'
      t.references     :record, comment: '収録シリーズ'
      t.timestamps
    end

    # ユーザ
    create_table :users, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名前'
      t.string         :email, null: false, default: "", comment: 'メールアドレス'
      t.integer        :flag, comment: 'フラグ', default: 0

      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    # カテゴリ
    create_table :categories, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名称'
      t.integer        :title, comment: 'タイトル（属性・種族・テーマ）'
      t.timestamps
    end

    # デッキ
    create_table :decks, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :name, comment: '名前'
      t.references     :category, comment: 'カテゴリ'
      t.references     :user, comment: 'ユーザ'
      t.text           :main, comment: 'メイン'
      t.text           :side, comment: 'サイド'
      t.timestamps
    end

    # デッキとカード
    create_table :deck_cards, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.references     :deck, comment: 'デッキ'
      t.references     :card, comment: 'カード'
      t.integer              :deck_type, comment: 'デッキタイプ'
      t.integer              :count, comment: '枚数'
      t.timestamps
    end

    # 大会情報
    create_table :tournaments, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string         :title, comment: 'タイトル'
      t.date           :date, commnet: '開催日'
      t.string         :place, comment: '開催場所'
      t.integer        :stage, comment: '大会レベル'

      t.timestamps
    end

    # 大会とデッキ
    create_table :tournament_decks, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.references     :tournament, comment: '大会'
      t.references     :deck, comment: 'デッキ'

      t.timestamps
    end

    # デッキへのコメント
    create_table :deck_comments, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.references     :user, comment: 'ユーザ'
      t.references     :deck, comment: 'デッキ'
      t.text                 :comment, comment: 'コメント'
      t.integer              :flag, comment: 'フラグ'

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
