class Card < ApplicationRecord
  belongs_to :attribute_model, class_name: 'Attribute', foreign_key: :attribute_id
  belongs_to :tribe

  enum flag: %i(none prohibition restriction semilimit), _prefix: :card
end
