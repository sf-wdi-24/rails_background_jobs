Rails.application.routes.draw do

  root "posts#index"
  resources :posts do
    resources :comments, except: [:index, :show]
  end

  resources :users, except: [:new]
  resources :favorites, only: [:create]
  delete "/favorites/:post_id", to: "favorites#destroy"

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

end