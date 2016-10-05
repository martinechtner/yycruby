Rails.application.routes.draw do
  resources :sponsors
  resources :events, only: [:index, :show]
  root to: 'home#index'
end
