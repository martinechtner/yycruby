Rails.application.routes.draw do
  resources :jobs, except: [:show]
  resources :sponsors, except: [:show]
  resources :events, only: [:index, :show]
  root to: 'home#index'
end
