Rails.application.routes.draw do
  devise_for :users
  root to: "upclick#index"
  put '/click', to: 'upclick#new'
end
