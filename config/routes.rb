Rails.application.routes.draw do
  root to: "home#index"
  get 'home/about'
  get 'home/staff'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #   sessions: 'users/sessions',
  #   passwords: 'users/passwords',
  #   registrations: 'users/registrations'
  #   omniauth_callbacks: "users/omniauth_callbacks"
  # }
  resources :posts do
    resources :comments
  end
  resources :comments
  resources :users
  resources :trips
end
