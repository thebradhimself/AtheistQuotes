Rails.application.routes.draw do

  root 'pages#index'
  devise_for :users
  resources :quote_favorites 
  get '/favorites' => 'quote_favorites#favorites'
  get '/favoriting' => 'quote_favorites#favoriting'
  get '/check_favorite' => 'quote_favorites#check_favorite'
  get '/getFavoriteQuote' => 'quote_favorites#getFavoriteQuote'
  get '/removeFavorite' => 'quote_favorites#removeFavorite'

  get '/getQuotes' => 'pages#getQuotes'
  post 'update' => 'pages#update'
  get '/author' => 'pages#author'
  get '/authors' => 'pages#authors'
  post '/buffer_it', to: "pages#buffer_it"
end
