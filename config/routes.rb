Rails.application.routes.draw do
  resources :gamers
  resources :levels
  devise_for :users
  root to: "upclick#index"
  post '/click', to: 'upclick#new'
end
