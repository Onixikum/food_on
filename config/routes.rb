FoodOn::Application.routes.draw do
  resources :users
  resources :sessions,  only: [:new, :create, :destroy]
  resources :products,  only: [:new, :create]
  resources :orders,    only: [:index, :show, :new, :create]
  resources :companies, only: [:index, :new, :create]
  root 'static_pages#home'
  match '/signup',  to: 'users#new',         via: 'get'
  match '/signin',  to: 'sessions#new',      via: 'get'
  match '/signout', to: 'sessions#destroy',  via: 'delete'
  match '/help',    to: 'static_pages#help', via: 'get'
end
