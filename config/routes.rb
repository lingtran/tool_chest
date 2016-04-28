Rails.application.routes.draw do
  root to: "tools#index"
  resources :tools
  resources :users, only: [:index, :new, :create, :show] do
    resources :tools, only: [:show]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
