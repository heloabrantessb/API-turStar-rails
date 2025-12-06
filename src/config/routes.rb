Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :package_destinations
      resources :packages
      resources :destination_categories
      resources :users
      resources :categories
      resources :roles
      resources :destinations
      post "auth/login", to: "auth#login"
      delete "auth/logout", to: "auth#logout"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
