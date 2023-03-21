# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms, only: :index
    end
  end

  resources :audit_logs, only: :index do
    member do
      get :confirm
    end
  end

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
