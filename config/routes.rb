Rails.application.routes.draw do
  get 'current_user/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # get '/users', to: 'users#index'
  get '/current_user', to: 'current_user#index'
  # post '/api/v1/teachers', to: 'api/v1/teachers#index'
  # post 'api/v1/reservations', to: 'api/v1/reservations#index'

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :show, :create, :destroy]
      resources :teachers, only: [:index, :show, :create, :destroy]
    end
  end
end
