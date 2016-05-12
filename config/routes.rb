Rails.application.routes.draw do
  resources :levels
  devise_for :users
  root to: "upclick#index"
  post '/click', to: 'upclick#new'
end
