Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  get 'courses/all'
  resources :courses
  resources :universities 
  
  resources :users do 
    resources :courses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
