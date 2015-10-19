Rails.application.routes.draw do
  root :to => 'home#index'
  # is this a good idea? V
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :home
  resources :users
end
