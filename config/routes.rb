Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :users do
    get "users/auth/google_oauth2" => "devise/sessions#new"
  end

  resources :tweets
  resources :users
end
