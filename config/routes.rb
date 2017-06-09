Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
 
  resources :universities do 
    resources :courses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
