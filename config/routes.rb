Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :departments

  resources :news

  resources :projects

  resources :events

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users

  get '/approve/:id' ,to: 'projects#approve', as: :approve
  get '/apply/:id' ,to: 'projects#apply', as: :apply

end
