Rails.application.routes.draw do
  resources :reviews
  resources :bids
  resources :contractors
  resources :tasks
  resources :specialties
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :contractors, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#show'
      post '/login/contractor', to: 'auth#create_contractor'
      get '/contractor', to: 'contractors#show'
    end
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
