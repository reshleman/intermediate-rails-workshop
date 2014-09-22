Rails.application.routes.draw do
  root to: "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
