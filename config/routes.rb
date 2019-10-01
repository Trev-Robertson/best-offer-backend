Rails.application.routes.draw do
  resources :reviews
  delete '/contractor/bids/:id', to: 'bids#delete_contracor_bid'
  resources :bids
  resources :contractors
  resources :tasks
  resources :specialties
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :contractors, only: [:create]
      get '/profile', to: 'users#show'
      get '/contractor', to: 'contractors#show'
      post '/login/contractor', to: 'auth#create_contractor'
      post '/login', to: 'auth#create'
    end
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
