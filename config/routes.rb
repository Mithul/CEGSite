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
  get '/approval/' ,to: 'projects#approval', as: :approval
  get '/apply/:id' ,to: 'projects#apply', as: :apply

  namespace :api do
  namespace :v1 do
    devise_scope :user do
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end
end


end
