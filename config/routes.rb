Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users/schools#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  devise_for :school_admins, controllers: {
    sessions: 'school_admins/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope module: :users do
    resources :schools, only: [:index] do
      member do
        get "batches", as: 'list_batches'
      end
    end
    resources :batches, only: [:show] do
      member do
        put "apply"
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
