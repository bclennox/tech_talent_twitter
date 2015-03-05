Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  resources :users, only: [:show]
  resource :profile, only: [:edit, :update] do
    collection do
      post :follow
    end
  end
  resource :timeline, only: [:show]
end
