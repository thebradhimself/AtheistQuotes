Rails.application.routes.draw do

  root 'pages#index'
  get '/atheismapp' => 'pages#app'

  resources :addquote

  get '/addquote/quotes_added' => 'addquote#quotes_added'

end
