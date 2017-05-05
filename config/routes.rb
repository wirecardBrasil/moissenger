Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets
  resources :users
  get '/tweets', to: 'tweets#index'
  post '/tweets', to: 'tweets#index'
end
