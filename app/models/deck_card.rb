class DeckCard < ApplicationRecord
  belongs_to :card

  enum deck_type: %i(main extra side)
end
