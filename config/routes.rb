Rails.application.routes.draw do
  get 'sessions/new'
  
  resources :sessions
  resources :users
  root "hosts#index"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :host_historicos
  resources :redes
  resources :usuarios
  resources :hosts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
