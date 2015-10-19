Rails.application.routes.draw do
  root :to => 'home#index'

  resources :home
  resources :users
end
