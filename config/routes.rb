Rails.application.routes.draw do

  resources :addquote
  root 'pages#index'
  get '/allquotes' => 'pages#allquotes'
  get '/atheismapp' => 'pages#app'
  get '/addquote/quotes_added' => 'addquote#quotes_added'
  get '/getQuotes' => 'pages#getQuotes'

end
