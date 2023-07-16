Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'reservations/index'
      post '/register', to: 'users#create'
      post '/login', to: 'sessions#create'
      resources :reservations, only: [:index]
      resources :concerts, only: [:index, :show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
