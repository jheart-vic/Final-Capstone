Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'api/v1/users#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy] do
         resources :reservations, only: [:index, :create, :update, :destroy]
      end
     resources :teachers, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
