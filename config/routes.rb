Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :shops, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :categories, :only => [:index, :show]
end
