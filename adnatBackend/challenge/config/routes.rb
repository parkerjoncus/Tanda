Rails.application.routes.draw do
  root 'home#index'
  
  resources :users do
      resources :organizations
      resources :shifts
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
