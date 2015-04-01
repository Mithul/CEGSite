Rails.application.routes.draw do
  resources :departments

  resources :news

  resources :projects

  resources :events

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
