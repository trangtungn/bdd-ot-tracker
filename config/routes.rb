# frozen_string_literal: true

Rails.application.routes.draw do
  resources :audit_logs, only: :index

  namespace :admin do
    resources :users
    resources :admin_users
    resources :posts

    root to: "users#index"
  end

  resources :posts do
    member do
      get :approve
    end
  end

  devise_for :users, controllers: { confirmations: 'confirmations' } , skip: :registrations, skip_helpers: true
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'static#homepage'
end
