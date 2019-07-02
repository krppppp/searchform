class DeckCard < ApplicationRecord
  belongs_to :card
  belongs_to :deck

  enum deck_type: %i(monster magic trap extra side)

  def main?
    (self.monster? || self.magic? || self.trap?) ? true : false
  end
end
