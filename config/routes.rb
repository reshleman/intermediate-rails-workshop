require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resources :hashtags, only: [:show]
  resources :photo_shouts, only: [:create]
  resource :search, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :users, only: [:new, :create, :show, :index] do
    post "follow" => "following_relationships#create"
    delete "follow" => "following_relationships#destroy"
  end
end
