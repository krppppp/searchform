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
end
