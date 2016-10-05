Rails.application.routes.draw do
  resources :events, only: [:index, :show]
  root to: 'home#index'
end
