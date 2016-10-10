Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    patch 'users', to: 'devise/registrations#update', as: 'user_registration'
  end
  resources :news
  resources :locations, only: [:index]
  resources :jobs, except: [:show]
  resources :sponsors, except: [:show]
  resources :events, only: [:index, :show]
  root to: 'home#index'
end
