Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users do
    resources :trips
    resources :posts
  end

  resources :trips
  resources :posts
  # get 'home/index'
  root to: "home#index"
  get 'home/about'
end
