Rails.application.routes.draw do
  get 'current_user/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/current_user', to: 'current_user#index'

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :show]
      resources :teachers, only: [:index, :create, :destroy, :show]
    end
  end
end
