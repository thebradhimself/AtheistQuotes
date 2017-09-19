Rails.application.routes.draw do

  root 'pages#index'
  resources :addquote
  devise_for :users
  get '/allquotes' => 'pages#allquotes'
  get '/atheismapp' => 'pages#app'
  get '/addquote/quotes_added' => 'addquote#quotes_added'
  get '/getQuotes' => 'pages#getQuotes'
  get '/favoriting' => 'pages#favoriting'
  get '/check_favorite' => 'pages#check_favorite'
  get '/favorites' => 'pages#favorites'
  get '/getFavoriteQuote' => 'pages#getFavoriteQuote'
  get '/removeFavorite' => 'pages#removeFavorite'
  get '/iamgod' => 'pages#admin'
  post 'update' => 'pages#update'
  get '/author' => 'pages#author'
  get '/authors' => 'pages#authors'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get '/allquotes' => 'pages#allquotes'
      get '/atheismapp' => 'pages#app'
      get '/addquote/quotes_added' => 'addquote#quotes_added'
      get '/getQuotes' => 'pages#getQuotes'
      get '/favoriting' => 'pages#favoriting'
      get '/check_favorite' => 'pages#check_favorite'
      get '/favorites' => 'pages#favorites'
      get '/getFavoriteQuote' => 'pages#getFavoriteQuote'
      get '/removeFavorite' => 'pages#removeFavorite'
    end
  end

end
