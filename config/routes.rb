Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :school_admins, controllers: {
    sessions: 'school_admins/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope module: :students do
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
  namespace :school_admins do
    resources :batches, only: [:index, :show, :create, :new, :edit, :update] do
      member do
        put "approve/:student_batch_id", to: "batches#approve", as: "approve"
        put "reject/:student_batch_id", to: "batches#reject", as: "reject"
        
        scope module: :batches do
          resources :courses, param: :course_id
        end
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
