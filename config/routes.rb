Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'places/:id', to: 'home#show', as: :place
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#index"
end
