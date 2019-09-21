Rails.application.routes.draw do
  resources :reviews
  resources :bids
  resources :contractors
  resources :tasks
  resources :specialties
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      # get '/user/:name', to: 'users#show'
    end
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
