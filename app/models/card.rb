class Card < ApplicationRecord

  enum flag: %i(none prohibition restriction semilimit), _prefix: :card
end
