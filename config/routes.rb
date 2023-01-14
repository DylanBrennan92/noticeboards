Rails.application.routes.draw do
  
  resources :boards do
    resources :posts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  #basic routes to test - edit later
  get "activity_log", to: "activity_log#index", as: :activity_log
  get "home", to: "home#index", as: :home
  
  #registrations routes [new and create]
  get "sign_up", to: "registrations#new", as: :sign_up
  post "sign_up", to: "registrations#create"

  #existing users log in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  #A logged in user can change their password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  #allow forgotten password to be reset
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  #routes for creating posts
  get "posts/new", to: "posts#new", as: :create_post
  post "posts/create", to: "home#index"

  get "boards", to: "boards#index", as: :all_boards
  get "boards/new", to: "boards#new", as: :create_board
  post "boards/:id/edit", to: "boards#edit"
  #patch "boards/:id/edit", to: "boards#update"


  #destroy session to log out user
  delete "logout", to: "sessions#destroy"
  
end
