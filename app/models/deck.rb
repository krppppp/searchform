class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :deck_cards
  has_many :deck_comments
  has_many :tournament_decks

  accepts_nested_attributes_for :deck_cards, :allow_destroy => true

end
