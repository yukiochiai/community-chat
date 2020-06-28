Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'tweets#index'
  devise_scope :user do
    post 'users/guest_sign_in',  to: 'users/sessions#guest'
  end
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :tweets do 
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end

