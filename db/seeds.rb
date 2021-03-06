# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_attributes(hash)
  attribute = Attribute.new(hash)
  attribute.save
end

def create_tribes(hash)
  tribe = Tribe.new(hash)
  tribe.save
end

def create_categories(hash)
  category = Category.new(hash)
  category.save!
end

def create_user(hash)
  user = User.new(hash)
  user.save
end

def create_decks(hash)
  deck = Deck.new(hash)
  deck.save
end

def create_deck_cards(hash)
  deck_card = DeckCard.new(hash)
  deck_card.save
end

def create_deck_comments(hash)
  deck_comment = DeckComment.new(hash)
  deck_comment.save
end

def create_tournaments(hash)
  tournament = Tournament.new(hash)
  tournament.save
end

def create_tournament_decks(hash)
  tournament_deck = TournamentDeck.new(hash)
  tournament_deck.save
end

case ENV["data"]
when "full"
  # 属性
  create_attributes({name: '闇' })
  create_attributes({name: '光' })
  create_attributes({name: '地' })
  create_attributes({name: '水' })
  create_attributes({name: '炎' })
  create_attributes({name: '風' })
  create_attributes({name: '神' })

  # 種族
    create_tribes({name: '悪魔族' })
    create_tribes({name: 'アンデット族' })
    create_tribes({name: '雷族' })
    create_tribes({name: '海竜族' })
    create_tribes({name: '岩石族' })
    create_tribes({name: '機械族' })
    create_tribes({name: '恐竜族' })
    create_tribes({name: '獣族' })
    create_tribes({name: '幻神獣族' })
    create_tribes({name: '昆虫族' })
    create_tribes({name: 'サイキック族' })
    create_tribes({name: '魚族' })
    create_tribes({name: '植物族' })
    create_tribes({name: '獣戦士族' })
    create_tribes({name: '戦士族' })
    create_tribes({name: '天使族' })
    create_tribes({name: '鳥獣族' })
    create_tribes({name: 'ドラゴン族' })
    create_tribes({name: '爬虫類族' })
    create_tribes({name: '炎族' })
    create_tribes({name: '魔法使い族' })
    create_tribes({name: '水族' })
    create_tribes({name: '創造神族' })
    create_tribes({name: '幻竜族' })
    create_tribes({name: 'サイバース族' })



  # カテゴリ

  # 属性
  #   create_categories({name: '闇', title: 0})
  #   create_categories({name: '光', title: 0})
  #   create_categories({name: '地', title: 0})
  #   create_categories({name: '水', title: 0})
  #   create_categories({name: '炎', title: 0})
  #   create_categories({name: '風', title: 0})
  #   create_categories({name: '神', title: 0})

  # 種族
  #   create_categories({name: '悪魔族', title: 1})
  #   create_categories({name: 'アンデット族', title: 1})
  #   create_categories({name: '雷族', title: 1})
  #   create_categories({name: '海竜族', title: 1})
  #   create_categories({name: '岩石族', title: 1})
  #   create_categories({name: '機械族', title: 1})
  #   create_categories({name: '恐竜族', title: 1})
  #   create_categories({name: '獣族', title: 1})
  #   create_categories({name: '幻神獣族', title: 1})
  #   create_categories({name: '昆虫族', title: 1})
  #   create_categories({name: 'サイキック族', title: 1})
  #   create_categories({name: '魚族', title: 1})
  #   create_categories({name: '植物族', title: 1})
  #   create_categories({name: '獣戦士族', title: 1})
  #   create_categories({name: '戦士族', title: 1})
  #   create_categories({name: '天使族', title: 1})
  #   create_categories({name: '鳥獣族', title: 1})
  #   create_categories({name: 'ドラゴン族', title: 1})
  #   create_categories({name: '爬虫類族', title: 1})
  #   create_categories({name: '炎族', title: 1})
  #   create_categories({name: '魔法使い族', title: 1})
  #   create_categories({name: '水族', title: 1})
  #   create_categories({name: '創造神族', title: 1})
  #   create_categories({name: '幻竜族', title: 1})
  #   create_categories({name: 'サイバース族', title: 1})

  # テーマ
    create_categories({name: 'A・O・J（ｱｰﾘｵﾌﾞｼﾞｬｽﾃｨｽ）', title: 2})
    create_categories({name: 'BF（ブラックフェザー）', title: 2})
    create_categories({name: 'BK（ﾊﾞｰﾆﾝｸﾞﾅｯｸﾗｰ））', title: 2})
    create_categories({name: 'C（コクーン）', title: 2})
    create_categories({name: 'C（チェーン）', title: 2})
    create_categories({name: 'D-HERO（ﾃﾞｨｰﾋｰﾛｰ）', title: 2})
    create_categories({name: 'DD（ディーディー）', title: 2})
    create_categories({name: 'D（ディフォーマー）', title: 2})
    create_categories({name: 'E-HERO（ｲｰﾋﾞﾙﾋｰﾛｰ）', title: 2})
    create_categories({name: 'EM(ｴﾝﾀﾒｲｲﾄ)・Em(ｴﾝﾀﾒｲｼﾞ)', title: 2})
    create_categories({name: 'E・HERO（ｴﾚﾒﾝﾀﾙﾋｰﾛｰ）', title: 2})
    create_categories({name: 'HERO（ヒーロー）', title: 2})
    create_categories({name: 'H・C、H-C（ﾋﾛｲｯｸ）', title: 2})
    create_categories({name: 'LV（レベル・レベルアップモンスター）', title: 2})
    create_categories({name: 'NO.（ﾅﾝﾊﾞｰｽﾞ）', title: 2})
    create_categories({name: 'N（ネオスペーシアン）', title: 2})
    create_categories({name: 'RUM・CNo・CX', title: 2})
    create_categories({name: 'SD（ｽｰﾊﾟｰﾃﾞｨﾌｪﾝｽ）', title: 2})
    create_categories({name: 'Sin（シン）', title: 2})
    create_categories({name: 'SR(スピードロイド)', title: 2})
    create_categories({name: 'TG（テックジーナス）', title: 2})
    create_categories({name: 'X-セイバー', title: 2})
    create_categories({name: 'ZW（ゼアル・ウェポン', title: 2})
    create_categories({name: '★エクシーズモンスター★', title: 2})
    create_categories({name: '★シンクロモンスター★', title: 2})
    create_categories({name: '★ペンデュラムモンスター★', title: 2})
    create_categories({name: '★リンクモンスター★', title: 2})
    create_categories({name: '★儀式モンスター★', title: 2})
    create_categories({name: '★融合モンスター★', title: 2})
    create_categories({name: 'おジャマ', title: 2})
    create_categories({name: 'アクアアクトレス・アクアリウム', title: 2})
    create_categories({name: 'アマゾネス', title: 2})
    create_categories({name: 'アモルファージ', title: 2})
    create_categories({name: 'アルカナフォース', title: 2})
    create_categories({name: 'アロマ', title: 2})
    create_categories({name: 'アンティーク・ギア', title: 2})
    create_categories({name: 'アンブラル', title: 2})
    create_categories({name: 'アーティファクト', title: 2})
    create_categories({name: 'イグナイト', title: 2})
    create_categories({name: 'インフェルニティ', title: 2})
    create_categories({name: 'インフェルノイド', title: 2})
    create_categories({name: 'インヴェルズ', title: 2})
    create_categories({name: 'ウィッチクラフト', title: 2})
    create_categories({name: 'エクシーズ', title: 2})
    create_categories({name: 'エレキ', title: 2})
    create_categories({name: 'エレメントセイバー', title: 2})
    create_categories({name: 'エンディミオン', title: 2})
    create_categories({name: 'エヴォル', title: 2})
    create_categories({name: 'エーリアン', title: 2})
    create_categories({name: 'オッドアイズ', title: 2})
    create_categories({name: 'オルターガイスト', title: 2})
    create_categories({name: 'カオス・ソルジャー', title: 2})
    create_categories({name: 'カラクリ', title: 2})
    create_categories({name: 'ガエル', title: 2})
    create_categories({name: 'ガガガ', title: 2})
    create_categories({name: 'ガジェット', title: 2})
    create_categories({name: 'ガスタ', title: 2})
    create_categories({name: 'ガーディアン', title: 2})
    create_categories({name: 'ギアギア', title: 2})
    create_categories({name: 'ギミック・パペット', title: 2})
    create_categories({name: 'ギャラクシー', title: 2})
    create_categories({name: 'クリフォート', title: 2})
    create_categories({name: 'クローラー', title: 2})
    create_categories({name: 'コアキメイル', title: 2})
    create_categories({name: 'コード・トーカー', title: 2})
    create_categories({name: 'ゴゴゴ', title: 2})
    create_categories({name: 'ゴブリン', title: 2})
    create_categories({name: 'ゴルゴニック', title: 2})
    create_categories({name: 'ゴーストリック', title: 2})
    create_categories({name: 'サイバー', title: 2})
    create_categories({name: 'サブテラー', title: 2})
    create_categories({name: 'シムルグ', title: 2})
    create_categories({name: 'シャドール', title: 2})
    create_categories({name: 'シンクロン', title: 2})
    create_categories({name: 'ジェネクス', title: 2})
    create_categories({name: 'ジェムナイト', title: 2})
    create_categories({name: 'ジャンク', title: 2})
    create_categories({name: 'ジュラック', title: 2})
    create_categories({name: 'スクラップ', title: 2})
    create_categories({name: 'ズババ', title: 2})
    create_categories({name: 'セイクリッド', title: 2})
    create_categories({name: 'セイヴァー', title: 2})
    create_categories({name: 'セフィラ', title: 2})
    create_categories({name: 'ゼンマイ', title: 2})
    create_categories({name: 'ダイナミスト', title: 2})
    create_categories({name: 'ダストン', title: 2})
    create_categories({name: 'デュアル', title: 2})
    create_categories({name: 'デーモン', title: 2})
    create_categories({name: 'トゥーン', title: 2})
    create_categories({name: 'トリックスター', title: 2})
    create_categories({name: 'ドドド', title: 2})
    create_categories({name: 'ドラグニティ', title: 2})
    create_categories({name: 'ナチュル', title: 2})
    create_categories({name: 'ネオス', title: 2})
    create_categories({name: 'ネフティス', title: 2})
    create_categories({name: 'ハーピィ', title: 2})
    create_categories({name: 'バウンサー', title: 2})
    create_categories({name: 'バスター・ブレイダー・破壊剣(はかいけん)', title: 2})
    create_categories({name: 'バージェストマ', title: 2})
    create_categories({name: 'ファーニマル・デストーイ・エッジインプ', title: 2})
    create_categories({name: 'フィッシュボーグ', title: 2})
    create_categories({name: 'フォトン', title: 2})
    create_categories({name: 'フォーチュンレディ', title: 2})
    create_categories({name: 'フレムベル', title: 2})
    create_categories({name: 'ブンボーグ', title: 2})
    create_categories({name: 'プランキッズ', title: 2})
    create_categories({name: 'ペンギンド', title: 2})
    create_categories({name: 'ホール・落とし穴・蟲惑魔(こわくま)', title: 2})
    create_categories({name: 'マシンナーズ', title: 2})
    create_categories({name: 'マドルチェ', title: 2})
    create_categories({name: 'マリスボラス', title: 2})
    create_categories({name: 'ムーンライト', title: 2})
    create_categories({name: 'メタファイズ', title: 2})
    create_categories({name: 'メタルフォーゼ', title: 2})
    create_categories({name: 'ライトレイ', title: 2})
    create_categories({name: 'ライトロード', title: 2})
    create_categories({name: 'ランク3エクシーズ', title: 2})
    create_categories({name: 'ランク4エクシーズ', title: 2})
    create_categories({name: 'ランク5エクシーズ', title: 2})
    create_categories({name: 'ラヴァル', title: 2})
    create_categories({name: 'リアクター', title: 2})
    create_categories({name: 'リゾネーター', title: 2})
    create_categories({name: 'リチュア', title: 2})
    create_categories({name: 'レアル・ジェネクス', title: 2})
    create_categories({name: 'レッドアイズ', title: 2})
    create_categories({name: 'レプティレス', title: 2})
    create_categories({name: 'ロイド', title: 2})
    create_categories({name: 'ワーム', title: 2})
    create_categories({name: 'ヴァイロン', title: 2})
    create_categories({name: 'ヴァレット', title: 2})
    create_categories({name: 'ヴァンパイア', title: 2})
    create_categories({name: 'ヴェノム', title: 2})
    create_categories({name: 'ヴェルズ', title: 2})
    create_categories({name: 'ヴェンデット', title: 2})
    create_categories({name: 'ヴォルカニック', title: 2})
    create_categories({name: '不知火(しらぬい)', title: 2})
    create_categories({name: '代行者（だいこうしゃ）', title: 2})
    create_categories({name: '先史遺産(ｵｰﾊﾟｰﾂ)', title: 2})
    create_categories({name: '光天使(ホーリー・ライトニング)', title: 2})
    create_categories({name: '六武衆（ろくぶしゅう）', title: 2})
    create_categories({name: '剛鬼(ごうき)', title: 2})
    create_categories({name: '剣闘獣（ｸﾞﾗﾃﾞｨｱﾙﾋﾞｰｽﾄ）', title: 2})
    create_categories({name: '化合獣(ｶｺﾞｳｼﾞｭｳ)', title: 2})
    create_categories({name: '十二獣', title: 2})
    create_categories({name: '占術姫(せんじゅつき)', title: 2})
    create_categories({name: '召喚獣(しょうかんじゅう)', title: 2})
    create_categories({name: '呪眼(じゅがん)', title: 2})
    create_categories({name: '地縛神（じばくしん）', title: 2})
    create_categories({name: '堕天使(だてんし)', title: 2})
    create_categories({name: '墓守（はかもり）', title: 2})
    create_categories({name: '壊獣(かいじゅう)', title: 2})
    create_categories({name: '天威(てんい)', title: 2})
    create_categories({name: '天気(てんき)', title: 2})
    create_categories({name: '契約書(けいやくしょ)', title: 2})
    create_categories({name: '妖仙獣(ようせんじゅう)', title: 2})
    create_categories({name: '守護竜 (しゅごりゅう)', title: 2})
    create_categories({name: '宝玉獣（ほうぎょくじゅう）', title: 2})
    create_categories({name: '宣告者(デクレアラー)', title: 2})
    create_categories({name: '封印(ふういん)されし', title: 2})
    create_categories({name: '巨大戦艦（きょだいせんかん）', title: 2})
    create_categories({name: '帝（みかど）', title: 2})
    create_categories({name: '幻奏(げんそう)', title: 2})
    create_categories({name: '幻影騎士団(ﾌｧﾝﾄﾑﾅｲﾂ)', title: 2})
    create_categories({name: '幻煌龍(げんおうりゅう)', title: 2})
    create_categories({name: '幻獣(げんじゅう)', title: 2})
    create_categories({name: '幻獣機(げんじゅうき)', title: 2})
    create_categories({name: '幻蝶(げんちょう)の刺客(しきゃく)', title: 2})
    create_categories({name: '影霊衣(ネクロス)', title: 2})
    create_categories({name: '彼岸(ひがん)', title: 2})
    create_categories({name: '征竜(せいりゅう)', title: 2})
    create_categories({name: '忍者・忍法(ﾆﾝｼﾞｬ・ﾆﾝﾎﾟｳ)', title: 2})
    create_categories({name: '捕食植物(ﾌﾟﾚﾃﾞﾀｰﾌﾟﾗﾝﾂ)', title: 2})
    create_categories({name: '方界(ほうかい)', title: 2})
    create_categories({name: '旧神・古神・外神', title: 2})
    create_categories({name: '星因士・星輝士（テラナイト）', title: 2})
    create_categories({name: '星杯(せいはい)・星遺物(せいいぶつ)', title: 2})
    create_categories({name: '時械神(ジカイシン', title: 2})
    create_categories({name: '暗黒界（あんこくかい）', title: 2})
    create_categories({name: '森羅（しんら）', title: 2})
    create_categories({name: '極星（きょくせい）', title: 2})
    create_categories({name: '機皇(きこう)', title: 2})
    create_categories({name: '武神(ブジン)', title: 2})
    create_categories({name: '水晶機巧（ｸﾘｽﾄﾛﾝ）', title: 2})
    create_categories({name: '水精鱗(ﾏｰﾒｲﾙ)', title: 2})
    create_categories({name: '氷結界（ひょうけっかい）', title: 2})
    create_categories({name: '海晶乙女(マリンセス)', title: 2})
    create_categories({name: '海皇(かいおう)', title: 2})
    create_categories({name: '炎星(ｴﾝｾｲ)', title: 2})
    create_categories({name: '炎王(えんおう)', title: 2})
    create_categories({name: '無限起動', title: 2})
    create_categories({name: '甲虫装機(ｲﾝｾﾞｸﾀｰ)', title: 2})
    create_categories({name: '真竜(しんりゅう)', title: 2})
    create_categories({name: '空牙団', title: 2})
    create_categories({name: '竜星', title: 2})
    create_categories({name: '竜魔王(りゅうまおう)', title: 2})
    create_categories({name: '紋章獣(ﾓﾝｼｮｳｼﾞｭｳ)', title: 2})
    create_categories({name: '素早い(すばやい)', title: 2})
    create_categories({name: '聖刻(ｾｲｺｸ)', title: 2})
    create_categories({name: '聖剣・聖騎士(ｾｲｹﾝ・ｾｲｷｼ)', title: 2})
    create_categories({name: '花札衛（ｶｰﾃﾞｨｱﾝ）', title: 2})
    create_categories({name: '超重武者(ちょうじゅうむしゃ)', title: 2})
    create_categories({name: '超量(ちょうりょう)', title: 2})
    create_categories({name: '閃刀姫(せんとうき)・閃刀(せんとう)', title: 2})
    create_categories({name: '陽炎獣(ﾍｲｽﾞﾋﾞｰｽﾄ)', title: 2})
    create_categories({name: '雲魔物（ｸﾗｳﾃﾞｨｱﾝ）', title: 2})
    create_categories({name: '電池メン', title: 2})
    create_categories({name: '霊使い・憑依装着', title: 2})
    create_categories({name: '霊獣(れいじゅう)', title: 2})
    create_categories({name: '霊神(ﾚｲｼﾝ)', title: 2})
    create_categories({name: '霞の谷（ミストバレー）', title: 2})
    create_categories({name: '青眼(ブルーアイズ）', title: 2})
    create_categories({name: '魔人(ﾏｼﾞﾝ)', title: 2})
    create_categories({name: '魔妖(まやかし)', title: 2})
    create_categories({name: '魔導書(まどうしょ)', title: 2})
    create_categories({name: '魔導獣(マジックビースト)', title: 2})
    create_categories({name: '魔弾(まだん)', title: 2})
    create_categories({name: '魔界劇団・魔界台本', title: 2})
    create_categories({name: '魔神儀(デビリチャル)', title: 2})
    create_categories({name: '魔装戦士・イーサルウェポン', title: 2})
    create_categories({name: '魔轟神（まごうしん）', title: 2})
    create_categories({name: '黒蠍（くろさそり）', title: 2})
    create_categories({name: 'Ｆ.Ａ.(ﾌｫｰﾐｭﾗｰｱｽﾘｰﾄ)', title: 2})
    create_categories({name: 'Ｋｏｚｍｏー', title: 2})
    create_categories({name: 'ＰＳＹ(サイ)フレーム', title: 2})
    create_categories({name: 'ＲＲ（ﾚｲﾄﾞ・ﾗﾌﾟﾀｰｽﾞ）', title: 2})
    create_categories({name: 'ＳＰＹＲＡＬ(ｽﾊﾟｲﾗﾙ)', title: 2})
    create_categories({name: 'Ｕ.Ａ.(ｳﾙﾄﾗｱｽﾘｰﾄ)', title: 2})

  # サンプルユーザ
    create_user({name: 'asdf', email: 'asdf@asdf', password: 'asdfasdf'})

  # サンプルデッキ
    1.upto(5) do |num|
      create_decks({name: "シリーズ#{num}", category_id: 1, user_id: 1})
    end

  # サンプルデッキカード
    1.upto(5) do |num|
      40.times do |card|
        create_deck_cards({deck_id: num, card_id: Card.all.sample.id, deck_type: rand(0..2), count: rand(1..3)})
      end
    end


  # サンプルコメント
    create_deck_comments({deck_id: 1, user_id: 1, comment: 'いいね！', flag: 0})

  # サンプル大会
    create_tournaments({title: '関東大会', date: Date.new(2019, 6, 30), place: '東京ビックサイト', stage: STAGE.map{|m| m.second}.sample})

  # サンプル大会デッキ
    create_tournament_decks({tournament_id: 1, deck_id: 1})
when "deck"
  # サンプルユーザ
  create_user({name: 'asdf', email: 'asdf@asdf', password: 'asdfasdf', flag: 0})
  create_user({name: 'admin', email: 'admin@admin', password: 'adminadmin', flag: 1})

  # サンプルデッキ
  1.upto(5) do |num|
    create_decks({name: "シリーズ#{num}", category_id: 1, user_id: 1})
  end

  # サンプルデッキカード
  1.upto(5) do |num|
    rand(40..60).times do |card|
      create_deck_cards({deck_id: num, card_id: Card.all.sample.id, deck_type: rand(0..2), count: rand(1..3)})
    end
  end

  # サンプルコメント
  create_deck_comments({deck_id: 1, user_id: 1, comment: 'いいね！', flag: 0})

  # サンプル大会
  create_tournaments({title: '関東大会', date: Date.new(2019, 6, 30), place: '東京ビックサイト', stage: STAGE.map{|m| m.second}.sample})

  # サンプル大会デッキ
  create_tournament_decks({tournament_id: 1, deck_id: 1})
when "deck_card"
  # サンプルデッキカード
  1.upto(5) do |num|
    count = 0
    max = rand(40..60)
    extra = rand(5..15)

    (Card.all.map{|m| m if m.extra?}.compact.sample(extra) | Card.all.sample(max - extra)).each do |card|
      p card
      rand = (rand(1..3)*rand(1..3)/3.0).ceil
      count = count + rand
      p max.to_s + ':' + count.to_s
      if (count > max)
        break
      else
        create_deck_cards({deck_id: num, card_id: card.id, deck_type: card.random_categolize, count: rand})
      end

    end
  end
else
  puts "Unknown: " + ENV["data"]
end
