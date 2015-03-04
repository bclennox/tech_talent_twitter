Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  resources :users, only: [:show]
  resource :profile, only: [:edit, :update]
end
