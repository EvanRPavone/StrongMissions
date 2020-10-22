Rails.application.routes.draw do
  root to: "home#index"
  get 'home/about'
  get 'home/staff'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments
  end
  resources :comments
  resources :users do
    resources :posts, shallow: true
  end
  resources :trips
end
