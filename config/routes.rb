Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)
  root to: "home#index"

  get 'places/:id', to: 'home#show', as: :place

  resources :users, only: %i[show edit update]
end
