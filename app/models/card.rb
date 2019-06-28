class Card < ApplicationRecord
  belongs_to :attribute_model, class_name: 'Attribute', foreign_key: :attribute_id
  belongs_to :tribe

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
end
