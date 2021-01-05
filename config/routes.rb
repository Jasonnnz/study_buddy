Rails.application.routes.draw do
  get 'friendships/new'
  # get 'friendships/create'
  
  resources :friendships, only: [:create, :destroy]
  resources :school_courses, only: [:new, :create]
  resources :student_courses, only: [:new, :create, :destroy, :edit, :update]
  resources :schools
  resources :courses
  resources :students

  get "/login", to: "sessions#login", as: "login"
  post "/handle_login", to: "sessions#handle_login"
  delete "/logout", to: "sessions#logout", as: "logout"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
