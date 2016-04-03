Rails.application.routes.draw do
  root to: "upclick#index"
  put '/click', to: 'upclick#new'
end
