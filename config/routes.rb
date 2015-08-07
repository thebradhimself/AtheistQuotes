Rails.application.routes.draw do

  root 'pages#index'

  resources :addquote
  get '/addquote/quotes_added' => 'addquote#quotes_added'
end
