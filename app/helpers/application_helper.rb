module ApplicationHelper
  def preview card
    if !card.image.blank? && card.image.file.present?
      card.image.url
    else
      'sample.png'
    end
  end

  def diversity deck_cards, type
    case type
    when 'main'
      set = {kind: deck_cards.map{|m| m if m.main? }.compact.count, count: deck_cards.map{|m| m.count if m.main? }.compact.sum}
    when 'monster'
      set = {kind: deck_cards.map{|m| m if m.main? && m.card.monster? }.compact.count, count: deck_cards.map{|m| m.count if m.main? && m.card.monster? }.compact.sum}
    when 'magic'
      set = {kind: deck_cards.map{|m| m if m.main? && m.card.magic? }.compact.count, count: deck_cards.map{|m| m.count if m.main? && m.card.magic? }.compact.sum}
    when 'trap'
      set = {kind: deck_cards.map{|m| m if m.main? && m.card.trap? }.compact.count, count: deck_cards.map{|m| m.count if m.main? && m.card.trap? }.compact.sum}
    when 'extra'
      set = {kind: deck_cards.map{|m| m if m.extra? }.compact.count, count: deck_cards.map{|m| m.count if m.extra? }.compact.sum}
    when 'side'
      set = {kind: deck_cards.map{|m| m if m.side? }.compact.count, count: deck_cards.map{|m| m.count if m.side? }.compact.sum}
    end

    set[:kind].to_s + '種・' + set[:count].to_s + '枚'
  end

  def sum_price deck_cards
    deck_cards.map{|m| m.card.price.blank? ? 0 : m.card.price }.sum
  end

end
