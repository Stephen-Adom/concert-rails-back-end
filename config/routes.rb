Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post '/register', to: 'users#create'
      post '/login', to: 'sessions#create'
      resources :reservations, only: [:index, :create]
      resources :concerts, only: [:index, :show, :create, :destroy]
    end
  end
end
