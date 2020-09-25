Rails.application.routes.draw do
  root 'home#index'
  
  resources :organizations do
        get 'leave'
  end
  
  resources :users do
      resources :shifts
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
