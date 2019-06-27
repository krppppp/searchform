module CardsHelper
  def level_rank_link card
    label = ['リンク: ', 'ランク: ', 'レベル: ']
    [card.link, card.rank, card.level].map.with_index{|m, index| label[index] + m.to_s if !m.blank? }.compact.first
  end
end
