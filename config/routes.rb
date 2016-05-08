Rails.application.routes.draw do
  devise_for :users
  root to: "upclick#index"
  post '/click', to: 'upclick#new'
end
