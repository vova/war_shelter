Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)
  root to: "home#index"

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'registration'
  end

  get 'places/:id', to: 'home#show', as: :place

  resources :users, only: %i[show edit update]
end
