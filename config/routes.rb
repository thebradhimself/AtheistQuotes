Rails.application.routes.draw do

  root 'pages#index'

  get '/author' => 'pages#author'
end
