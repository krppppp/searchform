class DeckComment < ApplicationRecord
  belongs_to :deck
  belongs_to :user
end
