require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resources :photo_shouts, only: [:create]
  resource :session, only: [:new, :create, :destroy]
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :users, only: [:new, :create, :show]
end
