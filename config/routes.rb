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
  # namespace :api, defaults: {format: 'json'} do
  #   namespace :v1 do
  #     get '/allquotes' => 'pages#allquotes'
  #     get '/atheismapp' => 'pages#app'
  #     get '/addquote/quotes_added' => 'addquote#quotes_added'
  #     get '/getQuotes' => 'pages#getQuotes'
  #     get '/favoriting' => 'pages#favoriting'
  #     get '/check_favorite' => 'pages#check_favorite'
  #     get '/favorites' => 'pages#favorites'
  #     get '/getFavoriteQuote' => 'pages#getFavoriteQuote'
  #     get '/removeFavorite' => 'pages#removeFavorite'
  #   end
  # end
  #
end
