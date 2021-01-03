Rails.application.routes.draw do
  devise_for :users
  root to: "shops#index"
  resources :shops
  namespace :admin do
    resources :admin_shops
  end
end
