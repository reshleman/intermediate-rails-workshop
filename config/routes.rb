require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resource :session, only: [:new, :create, :destroy]
  resources :shouts, only: [:create, :show]
  resources :users, only: [:new, :create, :show]
end
