Rails.application.routes.draw do
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

  root 'cards#index'
  get '/cards/search', to: 'cards#search', as: 'card_search'
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
