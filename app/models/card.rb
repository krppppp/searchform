class Card < ApplicationRecord
  belongs_to :attribute_model, class_name: 'Attribute', foreign_key: :attribute_id, optional: true
  belongs_to :tribe, optional: true

  # 名前書き換え
  # Card.all.map{|m| m.update!(name: m.name.gsub(",#{m.e_name}",'').gsub("#{m.name_kana},", '')) }


  enum flag: %i(none prohibition restriction semilimit), _prefix: :card

  mount_uploader :image, ImageUploader

  def monster?
    self.effect.blank? ? true : false
  end

  def magic?
    self.other.blank? && self.effect.include?('魔法') ? true : false
  end

  def trap?
    self.other.blank? && self.effect.include?('罠') ? true : false
  end

  # 融合モンスター、モンスター、モンスター、モンスター
  def extra?
    self.effect.blank? && ['融合', 'シンクロ', 'エクシーズ', 'リンク'].map{|m| self.other.include?(m) ? true : false}.include?(true) ? true : false
  end

  def categolized?
    type = 'uncategolized'
    type = 'monster' if self.monster?
    type = 'magic' if self.magic?
    type = 'trap' if self.trap?
    return type
  end

  def num_categolized?
    type = 'uncategolized'
    type = 0 if self.monster?
    type = 1 if self.magic?
    type = 2 if self.trap?
    type = 3 if self.extra?
    return type
  end

  def random_categolize
    self.extra? ? 3 : (rand(1..3) > 1 ? self.num_categolized? : 4)
  end

  def level?
    !self.level.blank? ? true : false;
  end

  def rank?
    !self.rank.blank? ? true : false;
  end

  def link?
    !self.link.blank? ? true : false;
  end

  def level_rank_link
    if self.level?
      self.level
    elsif self.rank?
      self.rank
    elsif self.link?
      self.link
    end

  end
end
