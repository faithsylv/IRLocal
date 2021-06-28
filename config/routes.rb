Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/pages/result' => 'pages#search'
  get '/pages/about' => 'pages#about'
  resources :shops
  resources :categories
  resources :brands
  resources :search, only: [:index]
end
