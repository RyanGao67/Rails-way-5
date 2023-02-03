Rails.application.routes.draw do
  resources :orders
  devise_for :users, controllers: {
    unlocks: 'users/unlocks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :line_items
  resources :carts
  get 'stores', to: 'stores#index'
  get 'welcome', to: 'welcome#index'
  root 'store#index', as: 'store_index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end