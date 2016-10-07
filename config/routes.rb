Rails.application.routes.draw do
  devise_for :users
  resources :locations, only: [:index]
  resources :jobs, except: [:show]
  resources :sponsors, except: [:show]
  resources :events, only: [:index, :show]
  root to: 'home#index'
end
