Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:show, :new, :create, :index]
  resources :lists, only: [:show, :new, :create, :index] do
    resources :bookmarks, only: [:create]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :bookmarks, only: [:index, :show, :destroy]
  # Defines the root path route ("/")
  # root "posts#index"
end
