Rails.application.routes.draw do

  devise_for :users
  resources :addquote
  root 'pages#index'
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
