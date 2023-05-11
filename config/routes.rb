Rails.application.routes.draw do
  root 'homes#index'
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

  # Defines the root path route ("/")
  # root "articles#index"
end
