Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :tweets
  resources :users
end
