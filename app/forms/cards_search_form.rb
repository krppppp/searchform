class CardsSearchForm < FormObject
  attribute :effect_category, String
  attribute :keyword, String
  attribute :name, Boolean
  attribute :name_kana, Boolean
  attribute :text, Boolean
  attribute :card_monster1, Integer
  attribute :card_monster2, Integer
  attribute :attribute, Integer
  attribute :tribe, Integer
  attribute :level_low, Integer
  attribute :level_high, Integer
  attribute :level, Boolean
  attribute :rank, Boolean
  attribute :pendulum_blue_low, Integer
  attribute :pendulum_blue_high, Integer
  attribute :pendulum_red_low, Integer
  attribute :pendulum_red_high, Integer
  attribute :link_low, Boolean
  attribute :link_high, Boolean
  attribute :left_up, Boolean
  attribute :up, Boolean
  attribute :right_up, Boolean
  attribute :left, Boolean
  attribute :right, Boolean
  attribute :left_down, Boolean
  attribute :down, Boolean
  attribute :right_down, Boolean
  attribute :offensive_power_low, Integer
  attribute :offensive_power_high, Integer
  attribute :offensive_power_nil, Boolean
  attribute :deffensive_power_low, Integer
  attribute :deffensive_power_high, Integer
  attribute :deffensive_power_nil, Boolean
  attribute :no_restriction, Boolean
  attribute :semi_restriction, Boolean
  attribute :restriction, Boolean
  attribute :ban, Boolean

  # <ActionController::Parameters {"effect_category"=>"", "keyword"=>"Aggiba", "name"=>"1", "name_kana"=>"1", "text"=>"1",
  # "card_monster1"=>"2", "card_monster2"=>"50", "tribe"=>"4", "level_low"=>"2", "level_high"=>"4", "level"=>"1", "rank"=>"1",
  # "pendulum_blue_low"=>"3", "pendulum_blue_high"=>"5", "pendulum_red_low"=>"2", "pendulum_red_high"=>"4",
  # "link_low"=>"2", "link_high"=>"2", "left_up"=>"1", "up"=>"1", "right_up"=>"1", "left"=>"1", "right"=>"0", "left_down"=>"0",
  # "down"=>"0", "right_down"=>"0", "offensive_power_low"=>"300", "offensive_power_high"=>"200", "offensive_power_nil"=>"1",
  # "deffensive_power_low"=>"300", "deffensive_power_high"=>"300", "deffensive_power_nil"=>"1", "no_restriction"=>"1",
  # "semi_restriction"=>"1", "restriction"=>"1", "ban"=>"1"} permitted: true>


  def search_card form
    result = Card.all

    p form

    # 効果分類
    if form[:effect_category].present?
      #TODO 文章から正規表現で実装
    end

    # キーワード
    if form[:keyword].present?
      if form[:name] && form[:name_kana] && form[:text]
        result = result.where(
            'name LIKE ? or
            name_kana LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name] && form[:name_kana]
        result = result.where(
            'name LIKE ? or
            name_kana LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name] && form[:text]
        result = result.where(
            'name LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name_kana] && form[:text]
        result = result.where(
            'name_kana LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name]
        result = result.where(
            'name LIKE ?',
            "%#{form[:keyword]}%")
      elsif form[:name_kana]
        result = result.where(
            'name_kana LIKE ?',
            "%#{form[:keyword]}%")
      elsif form[:text]
        result = result.where(
            'text LIKE ?',
            "%#{form[:keyword]}%")
      end
    end

    # カード種類
    # if form[:card_monster1].present? && form[:card_monster2].present?
    #   result = result.where(
    #       'other LIKE ?',
    #       "%#{CARD_CATEGORY.map{|m| m if m.second == form[:card_monster1].to_i }.compact.first.first.gsub('モンスター', '')}%")
    # elsif form[:card_monster1].present?
    #   result = result.where(
    #       'other LIKE ?',
    #       "%#{CARD_CATEGORY.map{|m| m if m.second == form[:card_monster1].to_i }.compact.first.first.gsub('モンスター', '')}%")
    # elsif form[:card_monster2].present?
    #
    # end

    # 種族
    if form[:tribe].present?
      result = result.where(tribe_id: form[:tribe])
    end

    # 属性
    if form[:attribute].present?
      result = result.where(attribute_id: form[:attribute])
    end

    # レベル
    if !form[:level_low].blank? && !form[:level_high].blank?
      result = result.where('(level >= ? and level <= ?) or (rank >= ? and rank <= ?)', form[:level_low].to_i, form[:level_high].to_i, form[:level_low].to_i, form[:level_high].to_i) if form[:level] == '1' && form[:rank] == '1'
      result = result.where('level >= ? and level <= ?', form[:level_low].to_i, form[:level_high].to_i) if form[:level] == '1' && form[:rank] == '0'
      result = result.where('rank >= ? and rank <= ?', form[:level_low].to_i, form[:level_high].to_i) if form[:rank] == '1' && form[:level] == '0'
    elsif !form[:level_low].blank?
      result = result.where('(level >= ?) or (rank >= ?)', form[:level_low].to_i, form[:level_low].to_i) if form[:level] == '1' && form[:rank] == '1'
      result = result.where('level >= ?', form[:level_low].to_i) if form[:level] == '1' && form[:rank] == '0'
      result = result.where('rank >= ?', form[:level_low].to_i) if form[:rank] == '1' && form[:level] == '0'
    elsif !form[:level_high].blank?
      result = result.where('level <= ? or rank <= ?', form[:level_high].to_i, form[:level_high].to_i) if form[:level] == '1' && form[:rank] == '1'
      result = result.where('level <= ?', form[:level_high].to_i) if form[:level] == '1' && form[:rank] == '0'
      result = result.where('rank <= ?', form[:level_high].to_i) if form[:rank] == '1' && form[:level] == '0'
    end

    # ペンデュラム
    #TODO 青赤での数値の違いはあるのか
    if !form[:pendulum_blue_low].blank? && !form[:pendulum_blue_high].blank?
      result = result.where('pendulum_scale >= ? and pendulum_scale <= ? ', form[:pendulum_blue_low].to_i, form[:pendulum_blue_high].to_i)
    elsif !form[:pendulum_blue_low].blank?
      result = result.where('pendulum_scale >= ? ', form[:pendulum_blue_low].to_i)
    elsif !form[:pendulum_blue_high].blank?
      result = result.where('pendulum_scale <= ? ', form[:pendulum_blue_high].to_i)
    end

    if !form[:pendulum_red_low].blank? && !form[:pendulum_red_high].blank?
      result = result.where('pendulum_scale >= ? and pendulum_scale <= ? ', form[:pendulum_red_low].to_i, form[:pendulum_red_high].to_i)
    elsif !form[:pendulum_red_low].blank?
      result = result.where('pendulum_scale >= ? ', form[:pendulum_red_low].to_i)
    elsif !form[:pendulum_red_high].blank?
      result = result.where('pendulum_scale <= ? ', form[:pendulum_red_high].to_i)
    end

    # リンク
    #TODO 方向
    if !form[:link_low].blank? && !form[:link_high].blank?
      result = result.where('link >= ? and link <= ? ', form[:link_low].to_i, form[:link_high].to_i)
    elsif !form[:link_low].blank?
      result = result.where('link >= ? ', form[:link_low].to_i)
    elsif !form[:link_high].blank?
      result = result.where('link <= ? ', form[:link_high].to_i)
    end

    # 攻撃力
    if form[:offensive_power_nil] == '1'
      result = result.where(offensive_power: nil)
    elsif !form[:offensive_power_low].blank? && !form[:offensive_power_high].blank?
      result = result.where('offensive_power >= ? and offensive_power <= ? ', form[:offensive_power_low].to_i, form[:offensive_power_high].to_i)
    elsif !form[:offensive_power_low].blank?
      result = result.where('offensive_power >= ? ', form[:offensive_power_low].to_i)
    elsif !form[:offensive_power_high].blank?
      result = result.where('offensive_power <= ? ', form[:offensive_power_high].to_i)
    end

    # 守備力
    if form[:deffensive_power_nil] == '1'
      result = result.where(deffensive_power: nil)
    elsif !form[:deffensive_power_low].blank? && !form[:deffensive_power_high].blank?
      result = result.where('deffensive_power >= ? and deffensive_power <= ? ', form[:deffensive_power_low].to_i, form[:deffensive_power_high].to_i)
    elsif !form[:deffensive_power_low].blank?
      result = result.where('deffensive_power >= ? ', form[:deffensive_power_low].to_i)
    elsif !form[:deffensive_power_high].blank?
      result = result.where('deffensive_power <= ? ', form[:deffensive_power_high].to_i)
    end

    # 制限
    result1 = result.where(flag: 'none') if form[:no_restriction] == '1'
    result2 = result.where(flag: 'semilimit') if form[:semi_restriction] == '1'
    result3 = result.where(flag: 'restriction') if form[:restriction] == '1'
    result4 = result.where(flag: 'prohibition') if form[:ban] == '1'
    result = [result1, result2, result3, result4].flatten.compact.blank? ? result : result.uniq.sort

    return result
  end
end
