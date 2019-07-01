Rails.application.routes.draw do
  # ajax
  post '/ajax/cards', to: 'cards#ajax_card', as: 'ajax_card'

  resources :tribes
  resources :tournament_decks
  resources :deck_cards
  resources :record_cards
  resources :records
  devise_for :users
  resources :tournaments
  resources :decks
  resources :categories
  resources :species
  resources :attributes
  resources :users

  root 'cards#index'
  get '/cards/search', to: 'cards#search', as: 'card_search'
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
