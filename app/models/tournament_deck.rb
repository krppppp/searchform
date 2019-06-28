class TournamentDeck < ApplicationRecord
  belongs_to :deck
  belongs_to :tournament
end
