Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "homes#index"
  get "/jobs" , to:"homes#jobs"
  resources :companies do
    resources :jobs do
      resources :tags 
    end
  end
  resources :users
  resources :follows , only: [ :create, :destroy]

  get "/login" , to:"sessions#new"
  post "/login" , to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

end
